import 'package:flutter/material.dart';
import 'package:flutter_application_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_application_cubit/cubit/app_cubits.dart';
import 'package:flutter_application_cubit/page/detai_page.dart';
import 'package:flutter_application_cubit/page/home_page.dart';
import 'package:flutter_application_cubit/page/navigate_pages/main_pag.dart';
import 'package:flutter_application_cubit/page/welcom_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App_cubit_logics extends StatefulWidget {
  const App_cubit_logics({super.key});

  @override
  State<App_cubit_logics> createState() => _App_cubit_logicsState();
}

class _App_cubit_logicsState extends State<App_cubit_logics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state) {
          if (state is DetailState) {
            return Detail_page();
          }
          if (state is WelcomeState) {
            return WelomePage();
          }
          if (state is LoadedState) {
            return Main_page();
          }
          if (state is loadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
