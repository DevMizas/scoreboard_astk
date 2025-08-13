import 'dart:async';

import 'package:mobx/mobx.dart';
part 'kumite.viewmodel.g.dart';

class KumiteViewModel = _KumiteViewModelBase with _$KumiteViewModel;

abstract class _KumiteViewModelBase with Store {
  Timer? _ticker;

  @observable
  Duration remainingTime = Duration(minutes: 2);

  @observable
  bool isRunning = false;

  @observable
  int scoreToBlue = 0;

  @observable
  int scoreToRed = 0;

  @observable
  bool redFirstPoint = false;

  @observable
  bool blueFirstPoint = false;

  @action
  void setRedFirstPoint({required bool value}) {
    redFirstPoint = value;
  }

  @action
  void setBlueFirstPoint({required bool value}) {
    blueFirstPoint = value;
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

  void resetAll() {
    isRunning = false;
    scoreToBlue = 0;
    scoreToRed = 0;
    remainingTime = Duration(minutes: 2);
    redFirstPoint = false;
    blueFirstPoint = false;
  }
}