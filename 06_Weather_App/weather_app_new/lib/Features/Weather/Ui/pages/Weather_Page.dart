// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, type_literal_in_constant_pattern

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_new/Features/Weather/Bloc/bloc/weather_bloc.dart';
import 'package:weather_app_new/Features/Weather/Services/Location_Service.dart';

// Main Weather_Page Class

class Weather_Page extends StatefulWidget {
  Weather_Page({super.key});

  @override
  State<Weather_Page> createState() => _Weather_PageState();
}

class _Weather_PageState extends State<Weather_Page> {
  final WeatherBloc weatherBloc = WeatherBloc();
  final LocationService locationService = LocationService();

  @override
  void initState() {
    super.initState();
    weatherBloc.add(WeatherFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),

              // Backdrop Filter
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),

              // Main Column

              BlocConsumer<WeatherBloc, WeatherState>(
                bloc: weatherBloc,
                listenWhen: (previous, current) =>
                    current is WeatherActionState,
                buildWhen: (previous, current) =>
                    current is! WeatherActionState,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  print("Current state: $state");
                  if (state is WeatherLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherErrorState) {
                    return Center(
                      child: Text("Loading State"),
                    );
                  } else if (state is WeatherSuccessState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Location

                          Text(
                            "📍Bahawalpur",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Greeting

                          Text(
                            "Good Morning",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // image
                          Image.asset("Assets/rainy.png"),
                          SizedBox(height: 10),
                          // Temp Text
                          Center(
                              child: Text(
                            "21°C",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.w600,
                            ),
                          )),

                          // Weather Text

                          Center(
                              child: Text(
                            "THUNDERSTORM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                          SizedBox(height: 5),

                          // Date & Time

                          Center(
                              child: Text(
                            "Friday 16 . 09:41am",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                          SizedBox(height: 30),

                          // Row (Sunset and sunrise )

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Sunrise

                              Row(
                                children: [
                                  Image.asset(
                                    "Assets/clear sun.png",
                                    scale: 16,
                                  ),
                                  SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sunrise",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "5:44 am",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Sunset

                              Row(
                                children: [
                                  Image.asset(
                                    "Assets/clear_moon.png",
                                    scale: 16,
                                  ),
                                  SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sunset",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "5:34 pm",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Divider

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(
                                thickness: 1,
                                color: Colors.white.withOpacity(0.5),
                              )),

                          // Row (High $ Low Temp)

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // High Temp

                              Row(
                                children: [
                                  Image.asset(
                                    "Assets/hot temp.png",
                                    scale: 130,
                                  ),
                                  // SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Max Temp",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "32°C",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Cold Temp

                              Row(
                                children: [
                                  Image.asset(
                                    "Assets/cold temp.png",
                                    scale: 130,
                                  ),
                                  //SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Temp Min",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "18°C",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Else Condition"),
                    );
                  }
                },
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
