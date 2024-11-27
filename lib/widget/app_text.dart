import 'package:flutter/material.dart';

class App_text extends StatelessWidget {
  double size;

  final text;
  final color;
  App_text(
      {Key? key, this.size = 16, required this.text, this.color = Colors.black54, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          decoration: TextDecoration.none,
          decorationColor: const Color.fromARGB(255, 27, 26, 12), // Specify the color of the underline
          color: color,
          fontSize: size,
         
        ));
  }
}
