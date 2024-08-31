import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_new/Features/Weather/Data/Weather_Data.dart'; // Import the weather package

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherFetchEvent>(weatherFetchEvent);
  }

  FutureOr<void> weatherFetchEvent(
      WeatherFetchEvent event, Emitter<WeatherState> emit) async {
    try {
      WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
      print("WeatherFactory created");

      Weather weather = await wf.currentWeatherByCityName("London");

      print("Weather data fetched: $weather");

      emit(WeatherSuccessState(weather));
    } catch (e) {
      print("Error fetching weather: $e");
      emit(WeatherErrorState());
    }
  }
}
