import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_application_cubit/cubit/app_cubits.dart';
import 'package:flutter_application_cubit/widget/app_text.dart';
import 'package:flutter_application_cubit/widget/large_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home_page> with TickerProviderStateMixin {

  var images_travel = {
    "passport.png": "passport",
    "airplane.png": "airplane",
    "travel.png": "travel",
    "flight.png": "flight",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitState>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(.3)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Large_text(text: 'Discover')),
              SizedBox(
                height: 20,
              ),
              //tabar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.only(right: 20, left: 5),
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      indicator:
                          CircleTabIndcator(color: Colors.black, radius: 4),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: false,
                      tabs: [
                        Tab(
                          text: 'Places',
                        ),
                        Tab(
                          text: 'Inspiration',
                        ),
                        Tab(
                          text: 'Emotion',
                        ),
                        Tab(
                          text: 'Freedom',
                        )
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                          child: Container(
                            margin: EdgeInsets.only(right: 15, top: 10),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(info[index].img)),
                            ),
                          ),
                        );
                      }),
                  Text('hello'),
                  Text('bye'),
                  Text('bye')
                ]),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Large_text(
                      text: 'Explore more',
                      size: 22,
                    ),
                    App_text(
                      text: 'see All',
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Container(
                height: 120,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              padding: EdgeInsets.all(20),
                              child: Image.asset('assets/images/' +
                                  images_travel.keys.elementAt(index)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(78, 160, 202, 236),
                              ),
                            ),
                            Container(
                              child: App_text(
                                  text: images_travel.values.elementAt(index)),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndcator extends Decoration {
  @override
  final Color color;
  double radius;
  CircleTabIndcator({required this.color, required this.radius});
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
