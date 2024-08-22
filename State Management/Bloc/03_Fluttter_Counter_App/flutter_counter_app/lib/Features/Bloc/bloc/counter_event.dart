part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterInitialEvent extends CounterEvent {}

class CounterResetEvent extends CounterEvent {}
