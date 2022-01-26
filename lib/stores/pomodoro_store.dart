import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:universal_html/js.dart' as js;

import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

enum TypeInterval { work, rest }

abstract class _PomodoroStoreBase with Store {
  final navigatorKey = GlobalKey<NavigatorState>();
  @observable
  int timeWork = 25;
  @observable
  int timeRest = 5;
  @observable
  int minutes = 25;
  @observable
  int seconds = 0;
  @observable
  bool initiated = false;

  @observable
  TypeInterval typeInterval = TypeInterval.work;

  Timer? cronometer;

  @action
  void initiate(BuildContext context) {
    initiated = true;
    cronometer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeIntervalType(context);
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

  @action
  void incrementWorkTime() {
    timeWork++;
    if (isWorking()) {
      refresh();
    }
  }

  @action
  void decrementWorkTime() {
    if (timeWork >= 1) {
      timeWork--;
      if (isWorking()) {
        refresh();
      }
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
    if (timeRest >= 1) {
      timeRest--;
      if (isResting()) {
        refresh();
      }
    }
  }

  bool isWorking() {
    return typeInterval == TypeInterval.work;
  }

  bool isResting() {
    return typeInterval == TypeInterval.rest;
  }

  void _changeIntervalType(BuildContext context) {
    if (isWorking()) {
      typeInterval = TypeInterval.rest;
      minutes = timeRest;
      if (kIsWeb) {
        js.context.callMethod('alertMessage', ['Agora é hora de descansar!']);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Agora é hora de descansar!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      typeInterval = TypeInterval.work;
      minutes = timeWork;
      if (kIsWeb) {
        js.context.callMethod('alertMessage', ['Agora é hora de trabalhar!']);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Agora é hora de trabalhar!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
    seconds = 0;
  }
}
