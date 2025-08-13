import 'package:flutter/material.dart';

class TextButtonToMenu extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const TextButtonToMenu({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
