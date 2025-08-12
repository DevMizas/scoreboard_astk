import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  const Flag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 5, height: 70, color: Colors.black87),
        Container(width: 50, height: 30, color: Colors.white),
      ],
    );
  }
}
