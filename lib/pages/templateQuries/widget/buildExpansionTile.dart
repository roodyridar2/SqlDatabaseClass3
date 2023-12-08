import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlcheatcode/main.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/sqlFormattedText.dart';

Widget buildExpansionTile({
  required String title,
  required List<String> keywords,
  required List<String> texts,
  required List<String> keywords2,
  required List<String> texts2,
  required String description,
  required String imagePath,
}) {
  return GestureDetector(
    onLongPress: () {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return ShowDialogImage(
            imagePath: imagePath,
          );
        },
      );
    },
    child: Card(
      elevation: 4,
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        title: SqlFormattedText(keywords: keywords, texts: texts),
        children: [
          Container(
            width: double.infinity,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description),
                  const SizedBox(height: 10),
                  SqlFormattedText(keywords: keywords2, texts: texts2),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


class ShowDialogImage extends StatefulWidget {
  const ShowDialogImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ShowDialogImage> createState() => _ShowDialogImageState();
}

class _ShowDialogImageState extends State<ShowDialogImage> {
  double rotateAngle = 0;
  double rotate45Degree = 90 * (3.141592653589793 / 180);
  double alertHigh = 400;
  @override
  Widget build(BuildContext context) {
    String imagePath = widget.imagePath.trim();
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 5),
      backgroundColor: const Color.fromARGB(87, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: imagePath != "" ? alertHigh : 100,
              child: imagePath != ""
                  ? InteractiveViewer(
                      // constrained: false,
                      minScale: 1,
                      child: Center(
                        child: Transform.rotate(
                          angle: rotateAngle,
                          child: Image.asset(
                            imagePath,
                            scale: 1.1,
                            // width: double.infinity,
                            // height: double.infinity,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        "Coming soon",
                        style: GoogleFonts.lato(fontSize: 25),
                      ),
                    ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 183, 63, 54),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Icon(
                    Icons.close,
                    size: 26,
                  ),
                ),
              ),
            ),
            imagePath != ""
                ? Positioned(
                    top: rotateAngle == rotate45Degree ? null : 0,
                    left: rotateAngle == rotate45Degree ? null : 0,
                    right: rotateAngle == rotate45Degree ? 0 : null,
                    bottom: rotateAngle == rotate45Degree ? 0 : null,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (rotateAngle == rotate45Degree) {
                            rotateAngle = 0;
                            alertHigh = 400;
                          } else {
                            rotateAngle = rotate45Degree;
                            alertHigh = double.infinity;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(18)),
                        child: const Icon(
                          Icons.rotate_90_degrees_ccw,
                          size: 26,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
