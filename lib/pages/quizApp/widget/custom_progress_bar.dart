
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required this.width,
    required this.height,
    required this.progress, required this.color,
  });
  final double width;
  final double height;
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[400],
      ),
      child: Stack(
        children: [
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${(progress * 100).toInt()}%",
              style: TextStyle(
                color: progress > 0.4
                    ? Colors.white
                    : color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // backgroundColor: Colors.black54,
                //
              ),
            ),
          ),
        ],
      ),
    );
  }
}
