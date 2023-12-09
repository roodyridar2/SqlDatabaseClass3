import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatTimestamp(Timestamp timestamp) {
  // Convert Timestamp to DateTime
  DateTime dateTime = timestamp.toDate();

  // Format the DateTime to the desired format
  String formattedDate = DateFormat("h:mm a - d MMM y").format(dateTime);

  return formattedDate;
}
