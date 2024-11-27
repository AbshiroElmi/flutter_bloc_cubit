import 'package:flutter/material.dart';
import 'package:flutter_application_cubit/widget/app_text.dart';

class Responsive_bottom extends StatelessWidget {
  bool? isResponsive ;
  double? width ;
  Responsive_bottom({super.key,  this.width=90, this.isResponsive =false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
      width: isResponsive! ? double.maxFinite : width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12)
        ),
      child: Row(
        mainAxisAlignment: isResponsive == true ?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
         isResponsive == true?  Container(
          margin: EdgeInsets.only(left: 20),
          child: App_text(text: 'Book Trip Now',color: Colors.white,)):Container(),
        Container(
          margin:isResponsive!? EdgeInsets.only(right: 20) :EdgeInsets.all(0),
          child: Image.asset(
                height: 25,
                width: 25,
                'assets/images/arrow.png'),
        ),
      ],),
      ),
    );
  }
}