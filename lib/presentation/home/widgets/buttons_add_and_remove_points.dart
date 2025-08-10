import 'package:flutter/material.dart';

class ButtonsAddAndRemovePoints extends StatelessWidget {
  final Function() addButton;
  final Function() removedBotton;
  final Color backgroudColor;
  const ButtonsAddAndRemovePoints({
    super.key,
    required this.addButton,
    required this.removedBotton,
    required this.backgroudColor,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;
    final double height = MediaQuery.of(context).size.height / 778;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: removedBotton,
          child: Container(
            width: 40 * width,
            height: 35 * height,
            decoration: BoxDecoration(
              color: backgroudColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black54),
            ),
            child: Icon(Icons.remove, color: Colors.black45),
          ),
        ),
        SizedBox(width: 20 * width),
        InkWell(
          onTap: addButton,
          child: Container(
            width: 40 * width,
            height: 35 * height,
            decoration: BoxDecoration(
              color: backgroudColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black54),
            ),
            child: Icon(Icons.add, color: Colors.black45),
          ),
        ),
      ],
    );
  }
}
