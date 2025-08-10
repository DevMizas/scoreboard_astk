import 'package:flutter/material.dart';
import 'package:placar_astk/core/core.dart';
import 'package:placar_astk/presentation/presentation.dart';

class Side extends StatelessWidget {
  final InfractionsViewModel c1VM = InfractionsViewModel();
  final InfractionsViewModel c2VM = InfractionsViewModel();

  final Color backgroudColor;
  final String score;
  final bool isBlueSide;
  final Function() addButton;
  final Function() removedButton;

  Side({
    super.key,
    required this.backgroudColor,
    required this.score,
    required this.isBlueSide,
    required this.addButton,
    required this.removedButton,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;
    final double height = MediaQuery.of(context).size.height / 778;

    return Expanded(
      child: Container(
        color: backgroudColor,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: 450 * height,
              width: double.infinity,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 1.5,
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Text(
                    score,
                    style: TextStyle(
                      fontSize: 370 * width,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ButtonsAddAndRemovePoints(
                addButton: addButton,
                removedBotton: removedButton,
                backgroudColor: backgroudColor,
              ),
            ),
            Infractions(
              title: "C1",
              infractionsVM: getIt<InfractionsViewModel>(
                instanceName: isBlueSide ? "blueC1" : "redC1",
              ),
              isBlueSide: isBlueSide,
            ),
            SizedBox(height: 10),
            Infractions(
              title: "C2",
              infractionsVM: getIt<InfractionsViewModel>(
                instanceName: isBlueSide ? "blueC2" : "redC2",
              ),
              isBlueSide: isBlueSide,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
