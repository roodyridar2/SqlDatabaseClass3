import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';

class TemplateQueries extends ConsumerStatefulWidget {
  const TemplateQueries({Key? key, required this.data, required this.title})
      : super(key: key);
  final List<Widget> data;
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TemplateQueriesState();
}

class _TemplateQueriesState extends ConsumerState<TemplateQueries> {
  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    List<Widget> data = widget.data;
    String title = widget.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 35,
            color: isDarkMode ? Colors.white : Colors.blue,
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return data[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
