import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

abstract class _PomodoroStoreBase with Store {
  @observable
  int timeWork = 2;
  @observable
  int timeRest = 1;

  @action
  void incrementWorkTime() {
    timeWork++;
  }

  @action
  void decrementWorkTime() {
    timeWork--;
  }

  @action
  void incrementRestTime() {
    timeRest++;
  }

  @action
  void decrementRestTime() {
    timeRest--;
  }
}
