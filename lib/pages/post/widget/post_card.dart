import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/util/time_stamp_formatter.dart';

class MyCard extends ConsumerWidget {
  const MyCard({
    super.key,
    required this.content,
    required this.email,
    required this.onDelete,
    required this.timeStamp,
    required this.textContentController,
    required this.onUpdated,
  });
  final String content;
  final String email;
  final Function() onDelete;
  final Timestamp timeStamp;
  final TextEditingController textContentController;
  final Function(String value) onUpdated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    TextEditingController textEditingController = TextEditingController();

    return Card(
      // elevation: 5, // Set margin around the card
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 15,
                    color: isDarkMode ? Colors.green : Colors.blue,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: FirebaseAuth.instance.currentUser!.email == email,
                  child: PopupMenuButton(itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            textEditingController.text = content;

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
                                          controller: textEditingController,
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
                                            onUpdated(
                                                textEditingController.text);
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
                          child: const Text('Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            onDelete();
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ];
                  }),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
                Text(
                  // '12:34 PM - 9 Dec 2023',
                  formatTimestamp(timeStamp).toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                // Visibility(
                //   visible: FirebaseAuth.instance.currentUser!.email == email,
                //   child: IconButton(
                //     onPressed: onDelete,
                //     icon: const Icon(
                //       Icons.delete,
                //       color: Color.fromARGB(255, 239, 77, 65),
                //     ),
                //   ),
                // ),
                // Visibility(
                //   visible: email == FirebaseAuth.instance.currentUser!.email,
                //   child: IconButton(
                //     icon: const Icon(Icons.edit),
                //     onPressed: () {
                //       textEditingController.text = content;

                //       showDialog(
                //           context: context,
                //           builder: (context) {
                //             return SizedBox(
                //               child: AlertDialog(
                //                 title: const Text('Edit Post'),
                //                 content: SizedBox(
                //                   width: 500,
                //                   height: 100,
                //                   child: TextField(
                //                     maxLength: 400,
                //                     maxLines: null,
                //                     controller: textEditingController,
                //                   ),
                //                 ),
                //                 actions: [
                //                   TextButton(
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                     },
                //                     child: const Text(
                //                       'Cancel',
                //                       style: TextStyle(
                //                         color: Colors.red,
                //                       ),
                //                     ),
                //                   ),
                //                   TextButton(
                //                     onPressed: () {
                //                       onUpdated(textEditingController.text);
                //                       Navigator.pop(context);
                //                     },
                //                     child: Text(
                //                       'Save',
                //                       style: TextStyle(
                //                         color: isDarkMode
                //                             ? Colors.green
                //                             : Colors.blue,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             );
                //           });
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
