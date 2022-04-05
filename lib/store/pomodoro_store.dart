import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
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
