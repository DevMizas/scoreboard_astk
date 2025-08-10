import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placar_astk/data/data.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final List<InfractionModel> infractionsList = [
    InfractionModel("C", Colors.black87),
    InfractionModel("K", Colors.black87),
    InfractionModel("HC", Colors.yellow),
    InfractionModel("H", Colors.red),
  ];

  @observable
  int currentCount = 0;
  
  Timer? _ticker;

  @observable
  Duration remainingTime = Duration(minutes: 2);

  @observable
  bool isRunning = false;

  @observable
  int scoreToBlue = 0;

  @observable
  int scoreToRed = 0;

  @action
  void addInfraction() {
    if (currentCount < infractionsList.length) {
      currentCount++;
    }
  }

  @action
  void removeInfraction() {
    if (currentCount > 0) {
      currentCount--;
    }
  }

  @action
  void addPointToBlue() {
    scoreToBlue++;
  }

  @action
  void removePointToBlue() {
    if (scoreToBlue > 0) scoreToBlue--;
  }

  @action
  void addPointToRed() {
    scoreToRed++;
  }

  @action
  void removePointToRed() {
    if (scoreToRed > 0) scoreToRed--;
  }

  @action
  void toggleTimer() {
    if (isRunning) {
      _pause();
    } else {
      _start();
    }
  }

  @action
  void setTime(Duration newTime) {
    _pause();
    remainingTime = newTime;
  }

  void _start() {
    isRunning = true;
    _ticker = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
      } else {
        _pause();
      }
    });
  }

  void _pause() {
    isRunning = false;
    _ticker?.cancel();
  }
}
