import 'package:flutter/material.dart';
import 'package:pomodoro/stores/pomodoro_store.dart';
import 'package:provider/provider.dart';

class InputTime extends StatelessWidget {
  final int value;
  final String title;
  final VoidCallback? increment;
  final VoidCallback? decrement;

  const InputTime({
    Key? key,
    required this.value,
    required this.title,
    this.increment,
    this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: decrement,
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: store.isWorking() ? Colors.red : Colors.green[700],
              ),
            ),
            Text(
              '$value min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: increment,
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: store.isWorking() ? Colors.red : Colors.green[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
