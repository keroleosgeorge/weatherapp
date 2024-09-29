import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Services/wheatherServices.dart';
import '../../model/weathermodel.dart';
import 'getweathercubit_state.dart';



class GetweathercubitCubit extends Cubit<GetweathercubitState> {
  GetweathercubitCubit() : super(GetweathercubitInitial());

  WeatherModel? weather;
  void getWeather(String cityName) async{
    try {
      WeatherServices weatherServices = WeatherServices(Dio());
       weather =
          await weatherServices.getCityWeather(cityName);
       emit(GetweathercubitLoaded());
    }   catch (e) {
      emit(GetweathercubitError());
    }

  }

}
