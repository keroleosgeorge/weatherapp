import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Services/wheatherServices.dart';
import 'package:weather_app/model/weathermodel.dart';

import '../Cubits/Getweathercubit/getweathercubit_cubit.dart';
import '../Providers/WeatherProvider.dart';

class Search extends StatelessWidget {
  Search({super.key});

  String? CityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            onChanged: (value) {
              CityName = value;
            },
            onSubmitted: (value) {
              CityName = value;
              WeatherServices weatherServices = WeatherServices(Dio());
              weatherServices.getCityWeather(CityName!);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: IconButton(
                onPressed: () async {
                  BlocProvider.of<GetweathercubitCubit>(context).getWeather(CityName!);
                  // Provider.of<WeatherProvider>(context, listen: false)
                  //     .WeatherData = weather;

                  Navigator.pop(context);
                },
                icon: Icon(Icons.search),
              ),
              labelText: 'Search',
              hintText: 'Enter city name',
              contentPadding: EdgeInsets.only(bottom: 20, top: 20, left: 10),
            ),
          ),
        ),
      ),
    );
  }
}
