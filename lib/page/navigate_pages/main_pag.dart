import 'package:flutter/material.dart';
import 'package:flutter_application_cubit/page/navigate_pages/bar_page.dart';
import 'package:flutter_application_cubit/page/home_page.dart';
import 'package:flutter_application_cubit/page/navigate_pages/profile_page.dart';
import 'package:flutter_application_cubit/page/navigate_pages/searching_page.dart';

class Main_page extends StatefulWidget {
  const Main_page({super.key});

  @override
  State<Main_page> createState() => _MAin_pageState();
}

class _MAin_pageState extends State<Main_page> {
  List pages = [
    Home_page(), 
    Bar_page(), 
    Searching_page(),
    Profile_page()
     ];
     int currentindex = 0;
     void onTap (int index){
      setState(() {
        currentindex=index;
      });

     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.white,
        onTap: onTap,
        currentIndex: currentindex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: 'Bar', icon: Icon(Icons.bar_chart_sharp)),
        BottomNavigationBarItem(label: 'Searching', icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.person))
      ]),
    );
  }
}
