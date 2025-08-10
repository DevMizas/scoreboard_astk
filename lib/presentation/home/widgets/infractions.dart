import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';

class Infractions extends StatelessWidget {
  final homeVM = GetIt.I.get<HomeViewModel>();
  final String title;
  

  Infractions({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;

    return GestureDetector(
      onTap: homeVM.addInfraction,
      onDoubleTap: homeVM.removeInfraction,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: homeVM.infractionsList.map((infraction) {
                  final isActive = homeVM.infractionsList.indexOf(infraction) < homeVM.currentCount;
                  return Text(
                    infraction.label,
                    style: TextStyle(
                      fontSize: 50 * width,
                      fontWeight: FontWeight.w600,
                      color: isActive ? infraction.color : Colors.black38,
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