import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum BreakTipe {
  work,
  rest,
}

abstract class _PomodoroStore with Store {
  Timer? cron;

  @observable
  BreakTipe breakType = BreakTipe.work;
  bool isWorking() => breakType == BreakTipe.work;
  bool isResting() => breakType == BreakTipe.rest;
  void _changeBreakType() {
    if (isWorking()) {
      breakType = BreakTipe.rest;
      minutes = restTime;
    } else {
      breakType = BreakTipe.work;
      minutes = workTime;
    }
    seconds = 0;
  }

  @observable
  int minutes = 2;
  @observable
  int seconds = 0;

  @observable
  bool isRunning = false;
  @action
  void startTimer() {
    isRunning = true;
    cron = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (minutes == 0 && seconds == 0) {
          _changeBreakType();
        } else if (seconds == 0) {
          seconds = 59;
          minutes--;
        } else {
          seconds--;
        }
      },
    );
  }

  @action
  void stopTimer() {
    isRunning = false;
    cron?.cancel();
  }

  @action
  void refreshTimer() {
    stopTimer();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  @observable
  int workTime = 2;
  @action
  void incrementWorkTimer() {
    workTime++;
    isWorking() ? refreshTimer() : null;
  }

  @action
  void decrementWorkTimer() {
    workTime--;
    workTime < 0 ? workTime = 0 : null;
    isWorking() ? refreshTimer() : null;
  }

  @observable
  int restTime = 1;
  @action
  void incrementRestTimer() {
    restTime++;
    restTime < 0 ? restTime = 0 : null;
    isResting() ? refreshTimer() : null;
  }

  @action
  void decrementRestTimer() {
    restTime--;
    restTime < 0 ? restTime = 0 : null;
    isResting() ? refreshTimer() : null;
  }
}
