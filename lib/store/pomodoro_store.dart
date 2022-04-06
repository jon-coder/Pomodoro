import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum BreakTipe {
  work,
  rest,
}

abstract class _PomodoroStore with Store {
  @observable
  BreakTipe breakType = BreakTipe.rest;

  bool isWorking() => breakType == BreakTipe.work;
  bool isResting() => breakType == BreakTipe.rest;

  @observable
  int minutes = 2;
  @observable
  int seconds = 0;

  @observable
  bool isRunning = false;
  @action
  void startTimer() {
    isRunning = true;
  }

  @action
  void stopTimer() {
    isRunning = false;
  }

  @action
  void refreshTimer() {
    isRunning = false;
  }

  @observable
  int workTimer = 2;
  @action
  void incrementWorkTimer() => workTimer++;
  @action
  void decrementWorkTimer() => workTimer--;

  @observable
  int restTime = 1;
  @action
  void incrementRestTimer() => restTime++;
  @action
  void decrementRestTimer() => restTime--;
}
