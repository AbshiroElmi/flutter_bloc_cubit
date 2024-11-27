import 'package:flutter/material.dart';
import 'package:flutter_application_cubit/widget/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String?text;
  IconData? icon;
  bool isicon;
   AppButtons({super.key, required this.color, 
   required this.backgroundColor,
    required this.borderColor,
    required this.size,
     this.text = 'hi',
     this.icon,
     this.isicon =false,
    
    
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor,
            width: 1.0
          ),
           color: backgroundColor),
           child: isicon ==false ? Center(child: App_text(text: text,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
