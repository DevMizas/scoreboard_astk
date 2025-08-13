import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:placar_astk/presentation/presentation.dart';
import 'package:placar_astk/resources/resources.dart';

class KumiteView extends StatelessWidget {
  const KumiteView({super.key});

  @override
  Widget build(BuildContext context) {
    final kumiteVM = GetIt.I.get<KumiteViewModel>();
    return Stack(
            children: [
              Row(
                children: [
                  Observer(
                    builder: (context) {
                      return Side(
                        backgroudColor: Colors.blue,
                        score: kumiteVM.scoreToBlue.toString(),
                        addButton: () {
                          kumiteVM.addPointToBlue();
                          if (kumiteVM.blueFirstPoint == false && kumiteVM.redFirstPoint == false && kumiteVM.scoreToBlue == 1 && kumiteVM.scoreToRed == 0) {
                            kumiteVM.setBlueFirstPoint(value: true);
                          }
                        },
                        removedButton: () {
                          kumiteVM.removePointToBlue();
                          if (kumiteVM.blueFirstPoint == true && kumiteVM.redFirstPoint == false && kumiteVM.scoreToBlue == 0) {
                            kumiteVM.setBlueFirstPoint(value: false);
                          }
                        },
                        isBlueSide: true,
                      );
                    },
                  ),
                  Side(
                    backgroudColor: Colors.red,
                    score: kumiteVM.scoreToRed.toString(),
                    addButton: () {
                      kumiteVM.addPointToRed();
                      if (kumiteVM.blueFirstPoint == false && kumiteVM.redFirstPoint == false && kumiteVM.scoreToBlue == 0 && kumiteVM.scoreToRed == 1) {
                        kumiteVM.setRedFirstPoint(value: true);
                      }
                    },
                    removedButton: () {
                      kumiteVM.removePointToRed();
                      if (kumiteVM.blueFirstPoint == false && kumiteVM.redFirstPoint == true && kumiteVM.scoreToRed == 0) {
                        kumiteVM.setRedFirstPoint(value: false);
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
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [if (kumiteVM.blueFirstPoint == true) Flag() else SizedBox(), if (kumiteVM.redFirstPoint == true) Flag() else SizedBox()]),
                  ),
                ),
              ),
              //=======  Timer
              Align(alignment: Alignment.center, child: TimerScoreboard()),
              //=======  Menu
              MenuView(),
            ],
          );
  }
}
