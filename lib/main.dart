import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/Home.dart';

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
    return  MaterialApp(
      home: Home(),
      theme: ThemeData(
        colorSchemeSeed: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor() ,
        appBarTheme: AppBarTheme(
          color: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
