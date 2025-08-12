import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';
import 'package:placar_astk/resources/resources.dart';

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
                  Observer(
                    builder: (context) {
                      return Side(
                        backgroudColor: Colors.blue,
                        score: homeVM.scoreToBlue.toString(),
                        addButton: () {
                          homeVM.addPointToBlue();
                          if (homeVM.blueFirstPoint == false && homeVM.redFirstPoint == false && homeVM.scoreToBlue == 1 && homeVM.scoreToRed == 0) {
                            homeVM.setBlueFirstPoint(value: true);
                          }
                        },
                        removedButton: () {
                          homeVM.removePointToBlue();
                          if (homeVM.blueFirstPoint == true && homeVM.redFirstPoint == false && homeVM.scoreToBlue == 0) {
                            homeVM.setBlueFirstPoint(value: false);
                          }
                        },
                        isBlueSide: true,
                      );
                    },
                  ),
                  Side(
                    backgroudColor: Colors.red,
                    score: homeVM.scoreToRed.toString(),
                    addButton: () {
                      homeVM.addPointToRed();
                      if (homeVM.blueFirstPoint == false && homeVM.redFirstPoint == false && homeVM.scoreToBlue == 0 && homeVM.scoreToRed == 1) {
                        homeVM.setRedFirstPoint(value: true);
                      }
                    },
                    removedButton: () {
                      homeVM.removePointToRed();
                      if (homeVM.blueFirstPoint == false && homeVM.redFirstPoint == true && homeVM.scoreToRed == 0) {
                        homeVM.setRedFirstPoint(value: false);
                      }
                    },
                    isBlueSide: false,
                  ),
                ],
              ),
              //======= Flags
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [if (homeVM.blueFirstPoint == true) Flag() else SizedBox(), if (homeVM.redFirstPoint == true) Flag() else SizedBox()]),
                  ),
                ),
              ),
              //=======  Timer
              Align(alignment: Alignment.center, child: Timer()),
              //=======  Menu
              Menu(),
            ],
          );
        },
      ),
    );
  }
}
