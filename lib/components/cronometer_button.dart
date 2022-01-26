import 'package:flutter/material.dart';

class CronometerButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  const CronometerButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 26,
        ),
        textStyle: const TextStyle(
          fontSize: 25,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 34,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
