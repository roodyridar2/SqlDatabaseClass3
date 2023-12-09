import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(70, 62, 67, 110),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: obscureText ? const Icon(Icons.lock) : const Icon(Icons.email),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                fillColor: Colors.white,
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.grey[300]!),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                enabledBorder: InputBorder.none,
                hintText: hintText,

                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.blue[700]!),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                focusedBorder: InputBorder.none,

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
