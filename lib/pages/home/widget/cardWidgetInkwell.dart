import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/templateQuries/template.dart';
import 'package:sqlcheatcode/util/constText.dart';
import 'package:animations/animations.dart';

class CardWidgetInkwell extends ConsumerWidget {
  const CardWidgetInkwell({
    super.key,
    required this.title,
    // required this.onTap,
    required this.description,
    required this.sizeText,
    required this.lecData,
  });
  final String title;
  final String description;
  // final void Function() onTap;
  final Enum sizeText;
  final List<Widget> lecData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();

    return OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        openElevation: 0,
        closedColor: Colors.transparent,
        closedElevation: 0,
        openColor: Colors.transparent,
        middleColor: Colors.transparent,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDarkMode ? const CardTheme().color : Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(image),
                  // const SizedBox(height: 10),
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: sizeText == SizeObj.small ? 20 : 33,
                      color: Colors.white,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      description,
                      style: GoogleFonts.lato(
                        fontSize: sizeText == SizeObj.small ? 8 : 14,
                        color: Colors.white,
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        openBuilder:
            (BuildContext _, CloseContainerActionCallback closeContainer) {
          return TemplateQueries(
            data: lecData,
            title: title,
          );
        });
  }
}
