import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometer.dart';
import 'package:pomodoro/components/input_time.dart';
import 'package:pomodoro/stores/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore store = Provider.of<PomodoroStore>(context);
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
                    value: store.timeWork,
                    title: 'Trabalho',
                    increment: store.initiated && store.isWorking()
                        ? null
                        : store.incrementWorkTime,
                    decrement: store.initiated && store.isWorking() ||
                            store.timeWork <= 1
                        ? null
                        : store.decrementWorkTime,
                  ),
                  InputTime(
                    value: store.timeRest,
                    title: 'Descanso',
                    increment: store.initiated && store.isResting()
                        ? null
                        : store.incrementRestTime,
                    decrement: store.initiated && store.isResting() ||
                            store.timeRest <= 1
                        ? null
                        : store.decrementRestTime,
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
