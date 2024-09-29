import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/Home.dart';

import 'Cubits/Getweathercubit/getweathercubit_cubit.dart';
import 'Cubits/Getweathercubit/getweathercubit_state.dart';
import 'Providers/WeatherProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => WeatherProvider(), child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<GetweathercubitCubit>(
  create: (context) => GetweathercubitCubit(),
  child: BlocBuilder<GetweathercubitCubit, GetweathercubitState>(
  builder: (context, state) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        colorSchemeSeed: BlocProvider.of<GetweathercubitCubit>(context).weather == null ? Colors.blue : BlocProvider.of<GetweathercubitCubit>(context).weather!.getThemeColor() ,
        appBarTheme: AppBarTheme(
          color: BlocProvider.of<GetweathercubitCubit>(context).weather == null ? Colors.blue : BlocProvider.of<GetweathercubitCubit>(context).weather!.getThemeColor() ,
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  },
),
);
  }
}
