part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

sealed class WeatherActionState extends WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherErrorState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final Weather weather;

  WeatherSuccessState(this.weather);

  @override
  List<Object> get props => [weather];
}

final class WeatherSnackState extends WeatherActionState {}
