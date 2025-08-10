import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';

class Timer extends StatelessWidget {
  final homeVM = GetIt.I.get<HomeViewModel>();
  Timer({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;

    String formatTime(Duration duration) {
      final minutes = duration.inMinutes.toString().padLeft(1, '0');
      final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
      return "$minutes:$seconds";
    }

    return Container(
      width: 260 * width,
      height: 195 * width,
      padding: EdgeInsets.only(bottom: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
            builder: (_) => InkWell(
              onTap: homeVM.toggleTimer,
              child: Text(
                formatTime(homeVM.remainingTime),
                style: TextStyle(
                  fontSize: 100 * width,
                  fontWeight: FontWeight.w600,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildTimeButton(
                label: "1:30",
                time: Duration(minutes: 1, seconds: 30),
              ),
              BuildTimeButton(label: "2:00", time: Duration(minutes: 2)),
              BuildTimeButton(label: "3:00", time: Duration(minutes: 3)),
            ],
          ),
        ],
      ),
    );
  }
}
