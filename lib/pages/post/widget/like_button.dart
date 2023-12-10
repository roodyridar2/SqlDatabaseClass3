import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.isLiked, required this.onTap});
  final bool isLiked;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: isLiked ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
