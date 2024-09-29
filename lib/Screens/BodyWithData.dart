import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/search.dart';
import 'package:weather_app/model/weathermodel.dart';

import '../Cubits/Getweathercubit/getweathercubit_cubit.dart';

class Bodywithdata extends StatelessWidget {
   Bodywithdata({super.key});

  WeatherModel ? weather;
  @override
  Widget build(BuildContext context) {
    weather =BlocProvider.of<GetweathercubitCubit>(context).weather;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              stops: [0.2, 0.5, 0.8],
              tileMode: TileMode.repeated,
              colors: [
                weather!.getThemeColor(),
                weather!.getThemeColor()[200]!,
                weather!.getThemeColor()[100]!,
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  ' ${weather!.countryName} , ${weather!.cityName}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Update at -> ${weather!.date.hour} : ${weather!.date.minute}',
              style: TextStyle(fontSize: 20),
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  weather!.icon, // Removed Uri, now it's a String
                  height: 80, // Adjusted height for better visibility
                  width: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                        Icons.error); // Handles errors like broken URLs
                  },
                ),
                Spacer(),
                Text(
                  '${weather!.Temp.toInt()}°C',
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'MaxTemp : ${weather!.MaxTemp.toInt()}°C',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'MinTemp : ${weather!.MinTemp.toInt()}°C',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              '${weather!.weatherStateName}',
              style: TextStyle(fontSize: 25),
            ),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
