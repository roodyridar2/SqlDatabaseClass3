import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/post/widget/post_card.dart';
import 'package:sqlcheatcode/pages/post/widget/post_text_field.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final textEditingController = TextEditingController();

  // final ScrollController _scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();

  //   _scrollController.addListener(() {
  //     if (_scrollController.offset >= 100.0) {
  //       // Show the button when the user scrolls down by 100 pixels
  //       setState(() {
  //         _showScrollToTopButton = true;
  //       });

  //       // After 3 seconds, set _showScrollToTopButton back to false
  //       Future.delayed(const Duration(seconds: 2), () {
  //         setState(() {
  //           _showScrollToTopButton = false;
  //         });
  //       });
  //     }
  //     // else {
  //     //   // Hide the button when the user scrolls up
  //     //   setState(() {
  //     //     _showScrollToTopButton = false;
  //     //   });
  //     // }
  //   });
  // }

  void postMessage() async {
    if (textEditingController.text.isEmpty) {
      return;
    }
    String postMessage = textEditingController.text;
    textEditingController.clear();
    _scrollController.animateToPage(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    try {
      await FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser!.email,
        'Message': postMessage,
        'TimeStamp': Timestamp.now(),
        // 'id': FirebaseFirestore.instance.collection('User Posts').doc().id,
        'Likes': []
      });
    } catch (e) {
      // print('Error: $e');
    }
    // _scrollController.animateTo(
    //   _scrollController.position.maxScrollExtent,
    //   duration: const Duration(seconds: 1),
    //   curve: Curves.easeInOut,
    // );
    // _scrollController.animateTo(
    //   0.0,
    //   duration: const Duration(seconds: 1),
    //   curve: Curves.easeInOut,
    // );
  }

  void onDelete(QueryDocumentSnapshot<Object?> post) {
    FirebaseFirestore.instance.collection('User Posts').doc(post.id).delete();
  }

  void onUpdated(String value, QueryDocumentSnapshot<Object?> post) {
    FirebaseFirestore.instance.collection('User Posts').doc(post.id).update({
      'Message': value,
    });
  }

  final PageController _scrollController = PageController();
  @override
  Widget build(BuildContext context) {
    // ref.watch(themeChangerNotifierProvider);
    // bool isDarkMode =
    //     ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return Scaffold(
      // backgroundColor: isDarkMode ? Colors.black12 : Colors.grey[300],
      // resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('User Posts')
                .orderBy('TimeStamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final posts = snapshot.data!.docs;
                return NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    // Add any additional logic you need based on scroll events
                    return false;
                  },
                  child: PageView.builder(
                      controller: _scrollController,
                      itemCount: posts.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: SizedBox(
                            height: 525,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 25.0,
                                top: 50.0,
                              ),
                              child: MyCard(
                                content: post['Message'],
                                email: post['UserEmail'],
                                onDelete: () => onDelete(post),
                                timeStamp: post['TimeStamp'],
                                textContentController: textEditingController,
                                onUpdated: (String value) =>
                                    onUpdated(value, post),
                                likes: List<String>.from(post['Likes']?? []),
                                postId: post.id,
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
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
          Positioned(
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PostTextField(
              postMessage: postMessage,
              textEditingController: textEditingController,
            ),
          )
        ],
      ),
    );
  }
}

  //  ListView.builder(
                  //   controller: _scrollController,
                  //   itemCount: posts.length,
                  //   itemBuilder: (context, index) {
                  //     final post = snapshot.data!.docs[index];
                  //     return MyCard(
                  //       content: post['Message'],
                  //       email: post['UserEmail'],
                  //       onDelete: () {
                  //         FirebaseFirestore.instance
                  //             .collection('User Posts')
                  //             .doc(post.id)
                  //             .delete();
                  //       },
                  //       timeStamp: post['TimeStamp'],
                  //       textContentController: textEditingController,
                  //       onUpdated: (String value) {
                  //         FirebaseFirestore.instance
                  //             .collection('User Posts')
                  //             .doc(post.id)
                  //             .update({
                  //           'Message': value,
                  //         });
                  //       },
                  //     );
                  //   },
                  // ),



                  // Positioned(
                  //   bottom: 100.0,
                  //   left: MediaQuery.of(context).size.width / 2 - 25,
                  //   child: Visibility(
                  //     visible: _showScrollToTopButton,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(200),
                  //       child: Container(
                  //         decoration: const BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.black12,
                  //               blurRadius: 10,
                  //               spreadRadius: 10,
                  //               offset: Offset(0, 0),
                  //             ),
                  //           ],
                  //         ),
                  //         child: BackdropFilter(
                  //           filter: ImageFilter.blur(
                  //             sigmaX: 5.0,
                  //             sigmaY: 5.0,
                  //           ),
                  //           child: IconButton(
                  //             onPressed: () {
                  //               // Scroll back to the top
                  //               _scrollController.animateTo(
                  //                 0.0,
                  //                 duration: const Duration(seconds: 1),
                  //                 curve: Curves.easeInOut,
                  //               );
                  //             },
                  //             icon: const Center(
                  //               child: Icon(
                  //                 Icons.arrow_upward,
                  //                 color: Colors.green,
                  //                 size: 25.0,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   )),
                // Positioned(
                //   left: 0,
                //   right: 0,
                //   bottom: 0,
                //   child: PostTextField(
                //     postMessage: postMessage,
                //     textEditingController: textEditingController,
                //   ),
                // )