import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/pdfViewer/pdfViewr.dart';
import 'package:sqlcheatcode/util/constText.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfGridCard extends ConsumerStatefulWidget {
  const PdfGridCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PdfGridCardState();
}

class _PdfGridCardState extends ConsumerState<PdfGridCard> {
  final Uri _url =
      Uri.parse('https://www.researchgate.net/profile/Zhenar-Faeq');

  Future<void> _launchInBrowserView() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  final _myTimerBox = Hive.box('myTimer');

  late int layoutSelect;
  late int crossValue = 2;
  @override
  void initState() {
    layoutSelect = _myTimerBox.get("pdfGridLayout") ?? 2;
    crossValue = _myTimerBox.get("pdfGridLayout") ?? 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: GestureDetector(
                  onTap: _launchInBrowserView,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dr.",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? Colors.green
                                  : const Color.fromARGB(255, 66, 164, 245),
                            ),
                          ),
                          Text(
                            "Zhenar shaho",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color.fromARGB(255, 66, 164, 245)),
                          ),
                        ],
                      ),
                      Container(
                        width: 170,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Koya university",
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 66, 164, 245),
                        ),
                      ),
                      Text(
                        "zhenar.shaho@koyauniversity.org",
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 66, 164, 245),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: 6,
                  height: 100,
                  color: isDarkMode ? Colors.green : Colors.blue,
                ),
              ),
              Positioned(
                bottom: -7,
                right: 10,
                child: PopupMenuButton(
                  color: isDarkMode
                      ? const Color.fromARGB(203, 27, 25, 25)
                      : const Color.fromARGB(107, 66, 164, 245),
                  elevation: isDarkMode ? 10 : 1,
                  icon: Icon(
                    Icons.view_quilt,
                    color: isDarkMode ? Colors.white : Colors.blue,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.view_agenda_sharp,
                            color: layoutSelect == 1
                                ? isDarkMode
                                    ? Colors.green
                                    : Colors.blue
                                : isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                          ),
                          const Text(" List")
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.widgets,
                            color: layoutSelect == 2
                                ? isDarkMode
                                    ? Colors.green
                                    : Colors.blue
                                : isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                          ),
                          const Text(" Grid 2x2")
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.view_module,
                            color: layoutSelect == 3
                                ? isDarkMode
                                    ? Colors.green
                                    : Colors.blue
                                : isDarkMode
                                    ? Colors.white
                                    : Colors.white,
                          ),
                          const Text(" Grid 3x3")
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      layoutSelect = value;
                      _myTimerBox.put("pdfGridLayout", value);
                    });
                    if (value == 1) {
                      setState(() {
                        crossValue = 1;
                      });
                    } else if (value == 2) {
                      setState(() {
                        crossValue = 2;
                      });
                    } else if (value == 3) {
                      setState(() {
                        crossValue = 3;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BuildGridViewPdf(crossValue),
            ),
          ),
          // SizedBox(height: 70),
        ],
      ),
    );
  }
}

class BuildGridViewPdf extends ConsumerWidget {
  const BuildGridViewPdf(this.crossAxisCount, {super.key});
  final int crossAxisCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    double aspectRatio = 1;
    // Enum sizeText = SizeObj.medium;
    double textFontSize = 20;

    if (crossAxisCount == 3) {
      aspectRatio = 1;
      // sizeText = SizeObj.big;
      textFontSize = 20;
    } else if (crossAxisCount == 2) {
      aspectRatio = 1 / 0.8;
      // sizeText = SizeObj.medium;
      textFontSize = 33;
    } else {
      aspectRatio = 1 / 0.4;
      // sizeText = SizeObj.small;
      textFontSize = 33;
    }
    return GridView.builder(
      itemCount: lectureNames.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return index < lectureNames.length
            ? InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfView(
                          pdfLink:
                              "assets/pdf/${Lecture.values[index].name}.pdf"),
                    ),
                  );
                },
                child: Card(
                  color: isDarkMode ? const CardTheme().color : Colors.blue,
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              lectureNames[Lecture.values[index]].toString(),
                              style: GoogleFonts.lato(
                                fontSize: textFontSize,
                                color: Colors.white,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "( ${index + 4} )",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Icon(
                          Icons.picture_as_pdf_outlined,
                          color: isDarkMode ? Colors.green : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
