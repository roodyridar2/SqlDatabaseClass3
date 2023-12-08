// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "theme_notifier.g.dart";

@riverpod
class ThemeChangerNotifier extends _$ThemeChangerNotifier {
  @override
  bool build() {
    return true;
  }

  bool getValue() {
    return state;
  }

  void toggleTheme() {
    state = !state;
  }
}
// dart run build_runner watch 