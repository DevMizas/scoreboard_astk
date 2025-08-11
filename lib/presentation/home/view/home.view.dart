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
                  isBlueSide: true,
                  ),
                  Side(backgroudColor: Colors.red,
                  score: homeVM.scoreToRed.toString(), 
                  addButton: homeVM.addPointToRed, 
                  removedButton: homeVM.removePointToRed,
                  isBlueSide: false,
                  ),
                ],
              ),
              //=======  Timer
              Align(alignment: Alignment.center, child: Timer()),
              //=======  Menu
              Container(
                height: 20,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue.shade400),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Icon(Icons.keyboard_arrow_down_rounded, size: 20,),
              ),
            ],
          );
        },
      ),
    );
  }
}
