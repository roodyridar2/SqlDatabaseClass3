import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';

class PostTextField extends ConsumerWidget {
  const PostTextField({
    super.key,
    required this.postMessage,
    required this.textEditingController,
  });
  final Function() postMessage;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border(
              top: BorderSide(
                  color: isDarkMode ? Colors.white : Colors.blue, width: 1),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: TextField(
                    maxLength: 400,
                    cursorColor: isDarkMode ? Colors.white : Colors.black87,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind?',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 10),
                onPressed: () {
                  postMessage();
                },
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode
                        ? Color.fromARGB(255, 83, 195, 87)
                        : Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
