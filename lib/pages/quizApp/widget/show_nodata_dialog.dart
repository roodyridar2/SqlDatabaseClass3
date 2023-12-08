
import 'package:flutter/material.dart';

void showNoDataDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        alignment: Alignment.center,
        title: const Text('No Data Available'),
        content: const Text('Coming soon.'),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      );
    },
  );
}
