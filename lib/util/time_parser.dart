Duration parseStringToDuration(String durationString) {
  List<String> parts = durationString.split(':');

  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  // Extract seconds and handle both integer and floating-point representations
  double seconds = double.parse(parts[2]);

  // Convert seconds to milliseconds (since Duration constructor doesn't accept double)
  int milliseconds = (seconds * 1000).round();

  // Create a Duration object
  Duration duration = Duration(
    hours: hours,
    minutes: minutes,
    milliseconds: milliseconds,
  );

  return duration;
}
