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
    final kumiteVM = GetIt.I<KumiteViewModel>();
    if (currentCount < infractionsList.length) {
      currentCount++;

      if (currentCount == 2) {
        if (!isBlueSide) {
          kumiteVM.addPointToBlue();
        } else {
          kumiteVM.addPointToRed();
        }
      }

      if (currentCount == 3) {
        if (!isBlueSide) {
          kumiteVM.addPointToBlue();
          kumiteVM.addPointToBlue();
        } else {
          kumiteVM.addPointToRed();
          kumiteVM.addPointToRed();
        }
      }
    }
  }

  @action
  void removeInfraction({required bool isBlueSide}) {
    final kumiteVM = GetIt.I<KumiteViewModel>();
    if (currentCount > 0) {
      currentCount--;

      if (currentCount == 1) {
        if (!isBlueSide) {
          kumiteVM.removePointToBlue();
        } else {
          kumiteVM.removePointToRed();
        }
      }

      if (currentCount == 2) {
        if (!isBlueSide) {
          kumiteVM.removePointToBlue();
          kumiteVM.removePointToBlue();
        } else {
          kumiteVM.removePointToRed();
          kumiteVM.removePointToRed();
        }
      }
    }
  }
}
