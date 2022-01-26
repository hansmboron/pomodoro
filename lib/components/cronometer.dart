import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometer_button.dart';
import 'package:pomodoro/stores/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometer extends StatelessWidget {
  const Cronometer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: store.isWorking() ? Colors.red : Colors.green[700],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Hora de trabalhar' : 'Hora de Descansar',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 120,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.initiated)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CronometerButton(
                        text: 'Iniciar',
                        icon: Icons.play_arrow,
                        onPressed: store.initiate),
                  ),
                if (store.initiated)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CronometerButton(
                      text: 'Parar',
                      icon: Icons.stop,
                      onPressed: store.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CronometerButton(
                    text: 'Reiniciar',
                    icon: Icons.refresh,
                    onPressed: store.refresh,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
