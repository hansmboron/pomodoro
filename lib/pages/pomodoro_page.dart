import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometer.dart';
import 'package:pomodoro/components/input_time.dart';
import 'package:pomodoro/stores/pomodoro_store.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore pomodoroStore = PomodoroStore();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Cronometer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTime(
                    value: pomodoroStore.timeWork,
                    title: 'Trabalho',
                    increment: pomodoroStore.incrementWorkTime,
                    decrement: pomodoroStore.decrementWorkTime,
                  ),
                  InputTime(
                    value: pomodoroStore.timeRest,
                    title: 'Descanso',
                    increment: pomodoroStore.incrementRestTime,
                    decrement: pomodoroStore.decrementRestTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
