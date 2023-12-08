import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';

class SqlFormattedText extends ConsumerWidget {
  const SqlFormattedText({
    Key? key,
    required this.keywords,
    required this.texts,
  }) : super(key: key);

  final List<String> keywords;
  final List<String> texts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    // assert(keywords.length == texts.length);

    List<TextSpan> textSpans = [];
    for (int i = 0; i < keywords.length; i++) {
      textSpans.add(
        TextSpan(
          text: '${keywords[i]} '.toUpperCase(),
          style: TextStyle(color: isDarkMode ? Colors.green : Colors.blue),
        ),
      );
      try {
        textSpans.add(TextSpan(text: '${texts[i]} '));
      } catch (e) {
        textSpans.add(const TextSpan(text: ' '));
      }
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: textSpans,
      ),
    );
  }
}
