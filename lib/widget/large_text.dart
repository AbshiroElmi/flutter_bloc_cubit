import 'package:flutter/material.dart';

class Large_text extends StatelessWidget {
  double size;
  final text;
  final color;
  Large_text(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          decoration: TextDecoration.none,
          decorationColor: const Color.fromARGB(255, 27, 26, 12), // Specify the color of the underline
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ));
  }
}
