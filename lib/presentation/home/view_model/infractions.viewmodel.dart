import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:placar_astk/data/data.dart';
import 'package:placar_astk/presentation/presentation.dart';

part 'infractions.viewmodel.g.dart';

class InfractionsViewModel = _InfractionsViewModelBase
    with _$InfractionsViewModel;

abstract class _InfractionsViewModelBase with Store {
  final List<InfractionModel> infractionsList = [
    InfractionModel("C", Colors.black87),
    InfractionModel("K", Colors.black87),
    InfractionModel("HC", Colors.yellow),
    InfractionModel("H", Colors.red),
  ];

  @observable
  int currentCount = 0;

  @action
  void addInfraction({required bool isBlueSide}) {
    final homeVM = GetIt.I<HomeViewModel>();
    if (currentCount < infractionsList.length) {
      currentCount++;

      if (currentCount == 2) {
        if (!isBlueSide) {
          homeVM.addPointToBlue();
        } else {
          homeVM.addPointToRed();
        }
      }

      if (currentCount == 3) {
        if (!isBlueSide) {
          homeVM.addPointToBlue();
          homeVM.addPointToBlue();
        } else {
          homeVM.addPointToRed();
          homeVM.addPointToRed();
        }
      }
    }
  }

  @action
  void removeInfraction({required bool isBlueSide}) {
    final homeVM = GetIt.I<HomeViewModel>();
    if (currentCount > 0) {
      currentCount--;

      if (currentCount == 1) {
        if (!isBlueSide) {
          homeVM.removePointToBlue();
        } else {
          homeVM.removePointToRed();
        }
      }

      if (currentCount == 2) {
        if (!isBlueSide) {
          homeVM.removePointToBlue();
          homeVM.removePointToBlue();
        } else {
          homeVM.removePointToRed();
          homeVM.removePointToRed();
        }
      }
    }
  }
}
