import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/post/widget/like_button.dart';
import 'package:sqlcheatcode/util/time_stamp_formatter.dart';

class MyCard extends ConsumerStatefulWidget {
  const MyCard({
    super.key,
    required this.content,
    required this.email,
    required this.onDelete,
    required this.timeStamp,
    required this.textContentController,
    required this.onUpdated,
    required this.likes,
    required this.postId,
    required this.report,
  });

  final String content;
  final String email;
  final Function() onDelete;
  final Timestamp timeStamp;
  final TextEditingController textContentController;
  final Function(String value) onUpdated;
  final List<String> likes;
  final String postId;
  final void Function(
      String message, String question, String answer, String email) report;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyCardState();
}

class _MyCardState extends ConsumerState<MyCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    // access the document in  firebase
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
    if (isLiked) {
      documentReference.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      documentReference.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    TextEditingController textEditingController = TextEditingController();

    return GestureDetector(
      onDoubleTap: toggleLike,
      child: Card(
        // elevation: 5, // Set margin around the card
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 15,
                      color: isDarkMode ? Colors.green : Colors.blue,
                    ),
                  ),
                  const Spacer(),
                  FirebaseAuth.instance.currentUser!.email == widget.email
                      ? PopupMenuButton(itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  textEditingController.text = widget.content;

                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          child: AlertDialog(
                                            title: const Text('Edit Post'),
                                            content: SizedBox(
                                              width: 500,
                                              height: 100,
                                              child: TextField(
                                                maxLength: 400,
                                                maxLines: null,
                                                controller:
                                                    textEditingController,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  widget.onUpdated(
                                                      textEditingController
                                                          .text);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.green
                                                        : Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: const SizedBox(
                                    width: double.infinity,
                                    child: Text('Edit')),
                              ),
                            ),
                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onDelete();
                                },
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ];
                        })
                      : IconButton(
                          onPressed: () {
                            widget.report(widget.content, "", "", widget.email);
                          },
                          icon: Icon(Icons.report_gmailerrorred_sharp))
                  // ),
                ],
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                child: Text(
                  widget.content,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Spacer(),
              Row(
                children: [
                  Column(
                    children: [
                      LikeButton(
                        isLiked: isLiked,
                        onTap: toggleLike,
                      ),
                      Text(
                        widget.likes.length.toString(),
                        style: TextStyle(
                          color: isDarkMode ? Colors.grey : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.access_time,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    // '12:34 PM - 9 Dec 2023',
                    formatTimestamp(widget.timeStamp).toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
