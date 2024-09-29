import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/BodyWithData.dart';
import 'package:weather_app/Screens/Failure.dart';
import 'package:weather_app/Screens/nodatascreen.dart';
import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/model/weathermodel.dart';

import '../Cubits/Getweathercubit/getweathercubit_cubit.dart';
import '../Cubits/Getweathercubit/getweathercubit_state.dart';
import '../Providers/WeatherProvider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
   // weather = Provider.of<WeatherProvider>(context).WeatherData;
    weather = BlocProvider.of<GetweathercubitCubit>(context).weather;
    return Scaffold(
      body: BlocBuilder<GetweathercubitCubit, GetweathercubitState>
        (builder: (context, state) {
          if(state is GetweathercubitInitial){
            return Nodatascreen();
          }else if(state is GetweathercubitLoaded){
            return Bodywithdata();
          }else{
return Failure();
          }
        },),
    );
  }
}
