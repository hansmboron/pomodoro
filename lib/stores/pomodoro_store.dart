import 'dart:async';

import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

enum TypeInterval { work, rest }

abstract class _PomodoroStoreBase with Store {
  @observable
  int timeWork = 2;
  @observable
  int timeRest = 1;
  @observable
  int minutes = 2;
  @observable
  int seconds = 0;
  @observable
  bool initiated = false;

  @observable
  TypeInterval typeInterval = TypeInterval.work;

  Timer? cronometer;

  @action
  void incrementWorkTime() {
    timeWork++;
    if (isWorking()) {
      refresh();
    }
  }

  @action
  void decrementWorkTime() {
    timeWork--;
    if (isWorking()) {
      refresh();
    }
  }

  @action
  void incrementRestTime() {
    timeRest++;
    if (isResting()) {
      refresh();
    }
  }

  @action
  void decrementRestTime() {
    timeRest--;
    if (isResting()) {
      refresh();
    }
  }

  @action
  void initiate() {
    initiated = true;
    cronometer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    initiated = false;
    cronometer?.cancel();
  }

  @action
  void refresh() {
    stop();
    minutes = isWorking() ? timeWork : timeRest;
    seconds = 0;
  }

  bool isWorking() {
    return typeInterval == TypeInterval.work;
  }

  bool isResting() {
    return typeInterval == TypeInterval.rest;
  }

  void _changeIntervalType() {
    if (isWorking()) {
      typeInterval = TypeInterval.rest;
      minutes = timeRest;
    } else {
      typeInterval = TypeInterval.work;
      minutes = timeWork;
    }
    seconds = 0;
  }
}
