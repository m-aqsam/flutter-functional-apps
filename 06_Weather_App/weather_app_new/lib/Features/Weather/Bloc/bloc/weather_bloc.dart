import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_new/Features/Weather/Data/Weather_Data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    print("WeatherBloc initialized");
    on<WeatherFetchEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        print("WeatherFetchEvent received: ${event.position}");

        WeatherFactory wf = WeatherFactory('b7359c63c28d04a3562a5d0bc0ec7113',
            language: Language.ENGLISH);
        print("WeatherFactory created");

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);

        print("Weather data fetched: $weather");

        emit(WeatherSuccessState(weather));
      } catch (e, stackTrace) {
        print("Error fetching weather: $e");
        print("Stack trace: $stackTrace");
        emit(WeatherErrorState());
      }
    });
  }
}
