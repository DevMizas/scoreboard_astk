import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';

class BuildTimeButton extends StatelessWidget {
  final kumiteVM = GetIt.I.get<KumiteViewModel>();
  final String label;
  final Duration time;

  BuildTimeButton({super.key, required this.label, required this.time});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;
    return InkWell(
      onTap: () => kumiteVM.setTime(time),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20 * width,
          fontWeight: FontWeight.w600,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
