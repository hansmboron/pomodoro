import 'package:flutter/material.dart';
import 'package:pomodoro/components/input_time.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Pomodoro'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              InputTime(value: 25, title: 'Trabalho'),
              InputTime(value: 5, title: 'Descanso'),
            ],
          ),
        ],
      ),
    );
  }
}
