import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';

class HomeView extends StatelessWidget {
  final homeVM = GetIt.I.get<HomeViewModel>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Observer(
        builder: (context) {
          return Stack(
            children: [
              Row(
                children: [
                  Side(backgroudColor: Colors.blue,
                  score: homeVM.scoreToBlue.toString(), 
                  addButton: homeVM.addPointToBlue, 
                  removedButton: homeVM.removePointToBlue,
                  ),
                  Side(backgroudColor: Colors.red,
                  score: homeVM.scoreToRed.toString(), 
                  addButton: homeVM.addPointToRed, 
                  removedButton: homeVM.removePointToRed,
                  ),
                ],
              ),
              //=======  Timer
              Align(alignment: Alignment.center, child: Timer()),
            ],
          );
        },
      ),
    );
  }
}
