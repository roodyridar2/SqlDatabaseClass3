import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/post/widget/bottomSheet_textFeild.dart';
import 'package:sqlcheatcode/util/time_stamp_formatter.dart';
import 'package:flip_card/flip_card.dart';

class QuestionCard extends ConsumerStatefulWidget {
  const QuestionCard({
    super.key,
    required this.report,
    required this.question,
    required this.answer,
    required this.email,
    required this.onDelete,
    required this.timeStamp,
    // required this.textContentController,
    required this.onUpdated,
    // required this.likes,
    // required this.postId,
  });

  final String question;
  final String answer;
  final String email;
  final Function() onDelete;
  final Timestamp timeStamp;
  // final TextEditingController textContentController;
  final Function(List<String> values) onUpdated;
  // final List<String> likes;
  // final String postId;
  final void Function(
      String message, String question, String answer, String email) report;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyCardState();
}

class _MyCardState extends ConsumerState<QuestionCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  // bool isLiked = false;
  bool isRevealed = false;
  FlipCardController flipController = FlipCardController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   isLiked = widget.likes.contains(currentUser.email);
  // }

  // void toggleLike() {
  //   setState(() {
  //     isLiked = !isLiked;
  //   });

  // access the document in  firebase
  //   DocumentReference documentReference =
  //       FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
  //   if (isLiked) {
  //     documentReference.update({
  //       'Likes': FieldValue.arrayUnion([currentUser.email])
  //     });
  //   } else {
  //     documentReference.update({
  //       'Likes': FieldValue.arrayRemove([currentUser.email])
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    // TextEditingController textEditingController = TextEditingController();

    return FlipCard(
      flipOnTouch: false,
      controller: flipController,
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      front: Card(
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
                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  bottomSheetUpdate(
                                    context: context,
                                    questionText: widget.question,
                                    answerText: widget.answer,
                                    onUpdated: (List<String> values) =>
                                        widget.onUpdated(values),
                                  );
                                },
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ];
                        })
                      : IconButton(
                          onPressed: () {
                            widget.report("", widget.question, widget.answer,
                                widget.email);
                          },
                          icon: const Icon(Icons.report_gmailerrorred))
                ],
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                child: Text(
                  widget.question,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 66, 165, 70), // onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        flipController.toggleCard();
                        isRevealed = !isRevealed;
                      });
                    },
                    child: const Text(
                      'Show Answer',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  // Column(
                  //   children: [
                  //     LikeButton(
                  //       isLiked: isLiked,
                  //       onTap: toggleLike,
                  //     ),
                  //     Text(
                  //       widget.likes.length.toString(),
                  //       style: TextStyle(
                  //         color: isDarkMode ? Colors.grey : Colors.black,
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
      back: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: SingleChildScrollView(
                  child: Text(
                    widget.answer,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(
                      196, 160, 52, 1), // onPrimary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    flipController.toggleCard();
                    isRevealed = !isRevealed;
                  });
                },
                child: const Text(
                  'Hide Answer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}

bottomSheetUpdate({
  required BuildContext context,
  required String questionText,
  required String answerText,
  required Function(List<String> values) onUpdated,
}) {
  TextEditingController textBottomSheetQuestion = TextEditingController();
  TextEditingController textBottomSheetAnswer = TextEditingController();
  textBottomSheetQuestion.text = questionText;
  textBottomSheetAnswer.text = answerText;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 800,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            MyBottomSheetTextField(
              controller: textBottomSheetQuestion,
              hintText: "write your question here",
              isQuestion: true,
              title: 'Front Card',
            ),
            MyBottomSheetTextField(
              controller: textBottomSheetAnswer,
              hintText: "write your answer here",
              isQuestion: false,
              title: 'Back of Card',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    onUpdated([
                      textBottomSheetQuestion.text,
                      textBottomSheetAnswer.text,
                    ]);

                    // FirebaseFirestore.instance
                    //     .collection('User Posts')
                    //     .doc()
                    //     .update({
                    //   'Question': textBottomSheetQuestion.text,
                    //   'Answer': textBottomSheetAnswer.text,
                    // });
                    // postQuestion();
                    // FocusScope.of(context).unfocus();
                    // textBottomSheetQuestion.clear();
                    // textBottomSheetAnswer.clear();

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
