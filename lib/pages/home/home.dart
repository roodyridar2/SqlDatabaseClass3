import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/home/widget/gridHomeBuilder.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final _myTimerBox = Hive.box('myTimer');

  late int crossValue;
  late int layoutSelect;
  @override
  void initState() {
    layoutSelect = _myTimerBox.get("homeLayout") ?? 1;
    crossValue = _myTimerBox.get("homeLayout") ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SQL Code",
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: isDarkMode ? Colors.white : Colors.blue,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 50,
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
                        _myTimerBox.put("homeLayout", value);
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
                )
              ],
            ),
            // const SizedBox(height: 30),
            Expanded(child: gridHomeBuilder(crossValue, context)),
          ],
        ),
      ),
    );
  }
}
