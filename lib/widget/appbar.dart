import 'package:custom_timer/custom_timer.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/main.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/home/widget/customDilaog.dart';
import 'package:sqlcheatcode/util/time_parser.dart';

class CustomAppBarMain extends ConsumerWidget {
  const CustomAppBarMain({
    required this.controller,
    required this.myTimerBox,
    required this.onTimeSave,
    required this.getTime,

    // required this.controller,  this.myTimerBox, this.onTimeSave, this.getTime,
    super.key,
  });
  final CustomTimerController controller;
  final Box myTimerBox;
  final void Function(Duration timeData) onTimeSave;
  // required Duration timeData,
  final Duration Function() getTime;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        actions: [
          CustomTimer(
            controller: controller,
            builder: (state, remaining) {
              onTimeSave(remaining.duration);
              return GestureDetector(
                onTap: () {
                  Duration gTime = getTime();
                  Duration boxTime =
                      parseStringToDuration(myTimerBox.get(1) ?? "00:00:00");

                  String time = prettyDuration(boxTime + gTime);
                  showDialog(
                    context: navigatorKey.currentContext!,
                    builder: (BuildContext context) {
                      return CustomDialog(time: time);
                    },
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        remaining.seconds == "01"
                            ? "${prettyDuration(remaining.duration)}s"
                            : prettyDuration(remaining.duration),
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: isDark ? Colors.green : Colors.blue,
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
    ;
  }
}

// PreferredSizeWidget customAppBarMain({
//   required BuildContext context,
//   required CustomTimerController controller,
//   required Box myTimerBox,
//   required void Function(Duration timeData) onTimeSave,
//   // required Duration timeData,
//   required Duration Function() getTime,
//   required Color color,
// }) {
//   // Duration timeData = const Duration(hours: 0, minutes: 0, seconds: 0);

//   return AppBar(
//     actions: [
//       CustomTimer(
//         controller: controller,
//         builder: (state, remaining) {
//           onTimeSave(remaining.duration);
//           return GestureDetector(
//             onTap: () {
//               Duration gTime = getTime();
//               Duration boxTime =
//                   parseStringToDuration(myTimerBox.get(1) ?? "00:00:00");

//               String time = prettyDuration(boxTime + gTime);
//               showDialog(
//                 context: navigatorKey.currentContext!,
//                 builder: (BuildContext context) {
//                   return CustomDialog(time: time);
//                 },
//               );
//             },
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     remaining.seconds == "01"
//                         ? "${prettyDuration(remaining.duration)}s"
//                         : prettyDuration(remaining.duration),
//                     style: GoogleFonts.lato(
//                       fontSize: 18,
//                       color: color,
//                       textStyle: Theme.of(context)
//                           .textTheme
//                           .titleLarge!
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       )
//     ],
//   );
// }
