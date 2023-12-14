
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;

  // Constructor to receive title and content for the alert dialog
  const MyAlertDialog({super.key, required this.title, required this.content});

  // Method to show the alert dialog
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Call the show method to display the custom alert dialog
        show(context);
      },
      child: Text('Show Alert'),
    );
  }
}
