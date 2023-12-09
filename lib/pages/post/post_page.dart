import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
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

  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >= 100.0) {
        // Show the button when the user scrolls down by 100 pixels
        setState(() {
          _showScrollToTopButton = true;
        });

        // After 3 seconds, set _showScrollToTopButton back to false
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            _showScrollToTopButton = false;
          });
        });
      }
      // else {
      //   // Hide the button when the user scrolls up
      //   setState(() {
      //     _showScrollToTopButton = false;
      //   });
      // }
    });
  }

  void postMessage() async {
    if (textEditingController.text.isEmpty) {
      return;
    }
    String postMessage = textEditingController.text;
    textEditingController.clear();

    try {
      await FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser!.email,
        'Message': postMessage,
        'TimeStamp': Timestamp.now(),
        'id': FirebaseFirestore.instance.collection('User Posts').doc().id,
      });
    } catch (e) {
      print('Error: $e');
    }
    // _scrollController.animateTo(
    //   _scrollController.position.maxScrollExtent,
    //   duration: const Duration(seconds: 1),
    //   curve: Curves.easeInOut,
    // );
    _scrollController.animateTo(
      0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black12 : Colors.grey[300],
      // appBar: AppBar(
      //   // backgroundColor: Colors.blue[400],
      //   title: const Text('Home Page'),
      //   actions: [
      //     IconButton(
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //       },
      //       icon: const Icon(
      //         Icons.logout,
      //         color: Colors.red,
      //       ),
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = snapshot.data!.docs[index];
                            return MyCard(
                              content: post['Message'],
                              email: post['UserEmail'],
                              onDelete: () {
                                FirebaseFirestore.instance
                                    .collection('User Posts')
                                    .doc(post.id)
                                    .delete();
                              },
                              timeStamp: post['TimeStamp'],
                              textContentController: textEditingController,
                              onUpdated: (String value) {
                                FirebaseFirestore.instance
                                    .collection('User Posts')
                                    .doc(post.id)
                                    .update({
                                  'Message': value,
                                });
                              },
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Something went wrong'));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Positioned(
                    bottom: 100.0,
                    left: MediaQuery.of(context).size.width / 2 - 25,
                    child: Visibility(
                      visible: _showScrollToTopButton,
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
                                // Scroll back to the top
                                _scrollController.animateTo(
                                  0.0,
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
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: PostTextField(
                    postMessage: postMessage,
                    textEditingController: textEditingController,
                  ),
                )
              ],
            ),
          ),
          // PostTextField(
          //   postMessage: postMessage,
          //   textEditingController: textEditingController,
          // ),
        ],
      ),
    );
  }
}
