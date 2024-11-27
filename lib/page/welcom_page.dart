import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_cubit/cubit/app_cubits.dart';
import 'package:flutter_application_cubit/widget/app_text.dart';
import 'package:flutter_application_cubit/widget/large_text.dart';
import 'package:flutter_application_cubit/widget/responsive_bottom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelomePage extends StatefulWidget {
  const WelomePage({super.key});

  @override
  State<WelomePage> createState() => _WelomePageState();
}

class _WelomePageState extends State<WelomePage> {
  List images = [
    '1.jpg',
    'welcome1.jpg',
    'welcome3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/' + images[index]),
                    fit: BoxFit.cover)),
            child: Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Large_text(text: 'Trips'),
                      App_text(
                        text: 'Mountain',
                        size: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: App_text(
                          text:
                              'Mountain hikes give an Incredible sense of freedom along with endurance test',
                          size: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Responsive_bottom(
                          width: 120,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDot) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 2),
                        height: index == indexDot ? 25 :8,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDot ? Colors.black :Colors.grey ,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
