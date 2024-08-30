part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetchEvent extends WeatherEvent {
  final Position position;

  WeatherFetchEvent(this.position);

  @override
  List<Object> get props => [position];
}
