import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_cubit/cubit/app_cubit_logis.dart';
import 'package:flutter_application_cubit/cubit/app_cubits.dart';
import 'package:flutter_application_cubit/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({super.key});

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> with SingleTickerProviderStateMixin {
   void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child:App_cubit_logics()
      )));
    });
  }

  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Container(
          child: Image.asset('assets/images/splash_img.png'),
        ),
      ),
    );
  }
}
