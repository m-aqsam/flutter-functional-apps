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
      home: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Position obtained: ${snapshot.data}");
            final position = snapshot.data as Position;
            final weatherBloc = WeatherBloc();

            weatherBloc.add(WeatherFetchEvent(position));

            return BlocProvider<WeatherBloc>(
              create: (context) => weatherBloc,
              child: Weather_Page(),
            );
          } else if (snapshot.hasError) {
            print("Error obtaining position: ${snapshot.error}");
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          } else {
            print("Waiting for position...");
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  print("Fetching current position...");

  return await Geolocator.getCurrentPosition();
}
