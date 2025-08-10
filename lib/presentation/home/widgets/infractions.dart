import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placar_astk/presentation/presentation.dart';

class Infractions extends StatelessWidget {
  final InfractionsViewModel infractionsVM;
  final bool isBlueSide;
  final String title;

  const Infractions({
    super.key,
    required this.title,
    required this.infractionsVM,
    required this.isBlueSide,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;
    final double height = MediaQuery.of(context).size.height / 778;

    return GestureDetector(
      onTap: () {
        infractionsVM.addInfraction(isBlueSide: isBlueSide);
      },
      onDoubleTap: () {
        infractionsVM.removeInfraction(isBlueSide: isBlueSide);
      },
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 50 * width,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(width: 50 * width),
          Container(
            width: 400 * width,
            constraints: BoxConstraints(minHeight: 90 * height),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: infractionsVM.infractionsList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final infraction = entry.value;

                  if (index >= infractionsVM.currentCount) {
                    return const SizedBox.shrink();
                  }

                  return Text(
                    infraction.label,
                    style: TextStyle(
                      fontSize: 50 * width,
                      fontWeight: FontWeight.w600,
                      color: infraction.color,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
