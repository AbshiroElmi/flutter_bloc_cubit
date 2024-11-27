import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_application_cubit/cubit/app_cubits.dart';
import 'package:flutter_application_cubit/widget/appButtons.dart';
import 'package:flutter_application_cubit/widget/app_text.dart';
import 'package:flutter_application_cubit/widget/large_text.dart';
import 'package:flutter_application_cubit/widget/responsive_bottom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({super.key});

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  int gottenStarts = 4;
  int selectedIdex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(detail.place.img))),
                  )),
              Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        child: Image.asset(
                            height: 30,
                            width: 30,
                            'assets/images/arrow_back.png'),
                      ),
                    ],
                  )),
              Positioned(
                top: 250,
                child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Large_text(
                            text: detail.place.name,
                            color: Colors.black54,
                          ),
                          Large_text(
                            text: '\$' + detail.place.price.toString(),
                            color: Colors.black.withOpacity(0.6),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue[300],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          App_text(
                              text: detail.place.location,
                              color: Colors.blue[300])
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < detail.place.stars
                                    ? Colors.yellow[600]
                                    : Colors.grey,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          App_text(text: '(5.0)')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Large_text(
                        text: 'People',
                        size: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      App_text(
                        text: 'Number of people in your group',
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIdex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: selectedIdex == index
                                    ? Colors.blue
                                    : Colors.black,
                                backgroundColor: selectedIdex == index
                                    ? Colors.blue.withOpacity(0.05)
                                    : Colors.grey.withOpacity(0.5),
                                borderColor: Colors.transparent,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Large_text(
                        text: "Description",
                        size: 20,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      App_text(
                        text: detail.place.description,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 5,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: Colors.blue.withOpacity(0.5),
                        backgroundColor: Colors.white,
                        borderColor: Colors.blue,
                        size: 50,
                        isicon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Responsive_bottom(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
