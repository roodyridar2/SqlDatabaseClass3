import 'dart:ui';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/home/home.dart';
import 'package:sqlcheatcode/pages/post/post_page.dart';
import 'package:sqlcheatcode/pages/quizApp/quiz_app.dart';
import 'package:sqlcheatcode/util/time_parser.dart';
import 'package:sqlcheatcode/widget/appbar.dart';
import 'package:sqlcheatcode/widget/custom_page_view_ScrollPhysics.dart';
import 'package:sqlcheatcode/widget/drawer.dart';

final List<Widget> _tableList = [
  const PostScreen(),
  const Home(),
  const QuizApp(),
];

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyApp2State();
}

class _MyApp2State extends ConsumerState<MyApp>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  Duration timeData = const Duration(hours: 0, minutes: 0, seconds: 0);
  int timerSecond = 0;
  late final CustomTimerController _controller = CustomTimerController(
    vsync: this,
    begin: const Duration(seconds: -1),
    end: const Duration(hours: 24),
    initialState: CustomTimerState.counting,
    interval: CustomTimerInterval.milliseconds,
  );
  final _myTimerBox = Hive.box('myTimer');

  @override
  void initState() {
    _controller.start();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    String timeString =
        (timeData + parseStringToDuration(_myTimerBox.get(1) ?? "00:00:00"))
            .toString();

    // if (state == AppLifecycleState.detached) {
    //   _myTimerBox.put(1, timeString);
    // }

    if (state == AppLifecycleState.paused) {
      _myTimerBox.put(1, timeString);
      setState(() {
        timeData = Duration.zero;
        _controller.reset();
      });
    }
    if (state == AppLifecycleState.resumed) {
      _controller.start();
    }
  }

  void saveTime(Duration time) {
    timeData = time;
  }

  Duration getTime() {
    return timeData;
  }

  int pageIndex = 1;
  bool isDarkMode = false;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    ref.watch(themeChangerNotifierProvider);
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBarMain(
            controller: _controller,
            myTimerBox: _myTimerBox,
            onTimeSave: saveTime,
            getTime: getTime,
          ),
        ),
        drawer: const NavDrawer(),
        body: Stack(
          children: [
            PageView(
              physics: const CustomPageViewScrollPhysics(),
              controller: _pageController,
              children: _tableList,
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
            Visibility(
              visible: pageIndex != 0 ? true : false,
              child: Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.2)
                              : Colors.white.withOpacity(0.2),
                        ),
                        child: BottomNavigationBar(
                          currentIndex: pageIndex,
                          onTap: (int index) {
                            setState(() {
                              pageIndex = index;
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            });
                          },
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          selectedItemColor:
                              isDarkMode ? Colors.white : Colors.blue[600],
                          unselectedItemColor:
                              isDarkMode ? Colors.white54 : Colors.blue[400],
                          showSelectedLabels: true,
                          showUnselectedLabels: false,
                          items: [
                            BottomNavigationBarItem(
                              icon: Icon(
                                pageIndex == 0
                                    ? Icons.chat_bubble
                                    : Icons.chat_bubble_outline,
                                size: 32,
                              ),
                              label: "chat",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                pageIndex == 1
                                    ? Icons.home
                                    : Icons.home_outlined,
                                size: 32,
                              ),
                              label: "Home",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                pageIndex == 2
                                    ? Icons.question_mark_outlined
                                    : Icons.question_mark,
                                size: 32,
                              ),
                              label: "Quiz",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
