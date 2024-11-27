

import 'package:equatable/equatable.dart';
import 'package:flutter_application_cubit/model/data_model.dart';

abstract class CubitState extends  Equatable{}


class InitialState extends CubitState{
  @override
  List<Object> get props => [];
  
}


class WelcomeState extends CubitState{
  @override
  List<Object> get props => [];
}
class loadingState extends CubitState{
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState{
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends CubitState{
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}