import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meteo/Model/City.dart';

import 'HomePage.dart';
import 'Model/Weather.dart';
import 'app.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomepageCubit(c: City.getDefaultCity(), w: Weather.getDefaultWeather()),
        child: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (_, theme) {
            return MaterialApp(
              title: 'Application de météo',
              theme: ThemeData(),
              home: WeatherPage(title: 'Application de météo'),
            );
          },
        ));
  }
}