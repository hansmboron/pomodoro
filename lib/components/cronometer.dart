import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometer_button.dart';

class Cronometer extends StatelessWidget {
  const Cronometer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hora de trabalhar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:
                    CronometerButton(text: 'Iniciar', icon: Icons.play_arrow),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 10),
              //   child: CronometerButton(text: 'Parar', icon: Icons.stop),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CronometerButton(text: 'Reiniciar', icon: Icons.refresh),
              ),
            ],
          )
        ],
      ),
    );
  }
}
