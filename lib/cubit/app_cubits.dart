import 'package:bloc/bloc.dart';
import 'package:flutter_application_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_application_cubit/model/data_model.dart';
import 'package:flutter_application_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(loadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
