// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_new/Features/Weather/Bloc/bloc/weather_bloc.dart';
import 'package:weather_app_new/Features/Weather/Ui/pages/Weather_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => WeatherBloc(),
        child: Weather_Page(),
      ),
    );
  }
}
