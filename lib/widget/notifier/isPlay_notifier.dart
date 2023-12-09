// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "isPlay_notifier.g.dart";

@riverpod
class IsPlayMusicNotifier extends _$IsPlayMusicNotifier {
  @override
  bool build() {
    return false;
  }

  bool getValue() {
    return state;
  }

  void togglePlay() {
    state = !state;
  }
}
