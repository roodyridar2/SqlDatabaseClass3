import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/post/widget/bottomSheet_textFeild.dart';
import 'package:sqlcheatcode/pages/post/widget/post_card.dart';
import 'package:sqlcheatcode/pages/post/widget/post_text_field.dart';
import 'package:sqlcheatcode/pages/post/widget/question_card.dart';

class DialogBox2 {
  void show(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    // Call the showDialog function when the button is pressed
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Use the AlertDialog to create the dialog
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// ------------------------------
class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final textEditingController = TextEditingController();
  final textBottomSheetQuestion = TextEditingController();
  final textBottomSheetAnswer = TextEditingController();
  final PageController _scrollController = PageController();
  final searchEditingController = TextEditingController();
  String searchQuery = '';
  final _userRateLimitBox = Hive.box('rateLimit');

  // _userRateLimitBox.put("homeLayout", value);
  void postMessage() async {
    // ----------------- Rate Limit -----------------
    DateTime now = DateTime.now();

    String todayTime = DateTime(now.year, now.month, now.day).toString();

    String userTime = _userRateLimitBox.get("dateTime") ?? todayTime;

    if (userTime != todayTime) {
      _userRateLimitBox.put("dateTime", todayTime);
      _userRateLimitBox.put("postCount", 0);
      DialogBox2().show(context, title: "reset", content: 'test');
    }

    int postCount = _userRateLimitBox.get("postCount") ?? 0;
    if (postCount >= 5) {
      DialogBox2().show(context,
          title: "Rate Limit",
          content:
              "You can only post 5 times a day\nTry again later\nThank you\nDB3 Code Team\n👋$todayTime\n$userTime");
      return;
    }
    _userRateLimitBox.put("postCount", postCount + 1);

    //  -----------------------------------------------------

    if (textEditingController.text.isEmpty ||
        textEditingController.text.trim() == '') {
      return;
    }

    //  -----------------------------------------------------
    String postMessage = textEditingController.text;
    textEditingController.clear();
    _scrollController.animateToPage(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    try {
      // to show message posted

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message Posted'),
          duration: Duration(milliseconds: 1000),
        ),
      );
      // ----------------------
      await FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser!.email,
        'Message': postMessage,
        'TimeStamp': Timestamp.now(),
        // 'id': FirebaseFirestore.instance.collection('User Posts').doc().id,
        'Likes': [],
        'Question': '',
        'Answer': '',
      });
    } catch (e) {
      // print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text('$e'),
          duration: const Duration(milliseconds: 1000),
        ),
      );
    }
  }

  void postQuestion() async {
    if (textBottomSheetAnswer.text.isEmpty ||
        textBottomSheetAnswer.text.trim() == '' ||
        textBottomSheetAnswer.text.length < 3) {
      return;
    }
    if (textBottomSheetQuestion.text.isEmpty ||
        textBottomSheetQuestion.text.trim() == '' ||
        textBottomSheetQuestion.text.length < 3) {
      return;
    }

    _scrollController.animateToPage(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    try {
      await FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser!.email,
        'Message': '',
        'TimeStamp': Timestamp.now(),
        // 'id': FirebaseFirestore.instance.collection('User Posts').doc().id,
        'Likes': [],
        'Question': textBottomSheetQuestion.text,
        'Answer': textBottomSheetAnswer.text,
      });
    } catch (e) {
      // print('Error: $e');
    }
  }

  void addReport(QueryDocumentSnapshot<Object?> post, String message,
      String question, String answer, String email) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('User Reports')
        .doc(post.id)
        .get();

    var isExist = docSnapshot.exists;
    if (isExist) {
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('User Reports')
          .doc(post.id)
          .set({
        'UserEmail': email,
        'TimeStamp': Timestamp.now(),
        'Message': message,
        // 'id': FirebaseFirestore.instance.collection('User Posts').doc().id,
        'Question': question,
        'Answer': answer,
      });
    } catch (e) {
      // print('Error: $e');
    }
  }

  void onDelete(QueryDocumentSnapshot<Object?> post) {
    FirebaseFirestore.instance.collection('User Posts').doc(post.id).delete();
  }

  void onUpdated(String value, QueryDocumentSnapshot<Object?> post) {
    FirebaseFirestore.instance.collection('User Posts').doc(post.id).update({
      'Message': value,
    });
  }

  bool isVisible = true;
  bool showSearchButton = true;

  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return Scaffold(
      // backgroundColor: isDarkMode ? Colors.black12 : Colors.grey[300],

      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('User Posts')
                .orderBy('TimeStamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List posts = snapshot.data!.docs;
                // ----------------- Filter By Email -----------------

                if (searchEditingController.text.isNotEmpty) {
                  searchQuery = searchEditingController.text;

                  final filterPost = posts
                      .where((post) =>
                          post['UserEmail'].toLowerCase().trim() ==
                          searchQuery.toLowerCase().trim())
                      .toList();
                  posts = filterPost;
                }

                // ------------------------------------------
                return NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    // Add any additional logic you need based on scroll events
                    return false;
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).unfocus();

                        isVisible = true;
                        showSearchButton = true;
                      });
                    },
                    child: PageView.builder(
                        controller: _scrollController,
                        itemCount: posts.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final post = posts[index];

                          return SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: SizedBox(
                              // color: Colors.amber,
                              height: 535,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  bottom: 25.0,
                                  top: 60.0,
                                ),
                                child: post['Message'] == ''
                                    ? QuestionCard(
                                        question: post["Question"],
                                        answer: post["Answer"],
                                        email: post["UserEmail"],
                                        onDelete: () => onDelete(post),
                                        timeStamp: post["TimeStamp"],
                                        onUpdated: (List<String> value) {
                                          FirebaseFirestore.instance
                                              .collection('User Posts')
                                              .doc(post.id)
                                              .update({
                                            'Question': value[0],
                                            'Answer': value[1],
                                          });
                                        },
                                        report: (String message,
                                            String question,
                                            String answer,
                                            String email) {
                                          addReport(post, message, question,
                                              answer, email);
                                        },
                                      )
                                    : MyCard(
                                        content: post['Message'],
                                        email: post['UserEmail'],
                                        onDelete: () => onDelete(post),
                                        timeStamp: post['TimeStamp'],
                                        textContentController:
                                            textEditingController,
                                        onUpdated: (String value) =>
                                            onUpdated(value, post),
                                        likes: List<String>.from(
                                            post['Likes'] ?? []),
                                        postId: post.id,
                                        report: (String message,
                                                String question,
                                                String answer,
                                                String email) =>
                                            addReport(
                                          post,
                                          message,
                                          question,
                                          answer,
                                          email,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        }),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Visibility(
            visible: isVisible,
            child: Positioned(
              bottom: 110.0,
              // left: MediaQuery.of(context).size.width / 2 - 25,
              right: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        _scrollController.animateToPage(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Center(
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Positioned(
              bottom: 110.0,
              // left: MediaQuery.of(context).size.width / 2 - 25,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        textEditingController.clear();
                      },
                      icon: const Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PostTextField(
                postMessage: postMessage,
                textEditingController: textEditingController,
              ),
            ),
          ),
          showSearchButton
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: 0,
                  left: 150,
                  right: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showSearchButton = false;
                      });
                    },
                    child: Icon(
                      Icons.search,
                      color: isDarkMode ? Colors.white : Colors.blue,
                    ),
                  ),
                )
              : AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          isVisible = false;
                        });
                      },
                      controller: searchEditingController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = searchEditingController.text;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        hintText: 'Search by email',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              searchEditingController.clear();
                              searchQuery = '';
                            });
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.green,
                            size: 25.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // add border bottom

                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
          Visibility(
            visible: isVisible,
            child: Positioned(
              bottom: 110.0,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 800,
                              // color: Colors.amber,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  MyBottomSheetTextField(
                                    controller: textBottomSheetQuestion,
                                    hintText: "write your question here",
                                    isQuestion: true,
                                    title: 'Front Card:',
                                  ),
                                  MyBottomSheetTextField(
                                    controller: textBottomSheetAnswer,
                                    hintText: "write your answer here",
                                    isQuestion: false,
                                    title: 'Back of Card:',
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Close",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        onPressed: () {
                                          {
                                            postQuestion();
                                            FocusScope.of(context).unfocus();
                                            textBottomSheetQuestion.clear();
                                            textBottomSheetAnswer.clear();
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: const Icon(
                                          Icons.send,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: const Center(
                        child: Icon(
                          Icons.swap_vert,
                          color: Colors.green,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
