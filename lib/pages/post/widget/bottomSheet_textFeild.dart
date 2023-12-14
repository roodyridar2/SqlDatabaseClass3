
import 'package:flutter/material.dart';

class MyBottomSheetTextField extends StatelessWidget {
  const MyBottomSheetTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isQuestion,
    required this.title,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isQuestion;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 800,
      // color: Color.fromARGB(70, 62, 67, 110),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          TextField(
            autofocus: true,
            minLines: 5,
            maxLines: 10,
            controller: controller,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              // enabledBorder: InputBorder.none,
              hintText: hintText,

              // focusedBorder: InputBorder.none,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
