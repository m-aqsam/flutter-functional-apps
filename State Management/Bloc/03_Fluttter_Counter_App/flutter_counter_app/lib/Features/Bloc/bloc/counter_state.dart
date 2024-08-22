part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

sealed class CounterActionState extends CounterState {}

final class CounterInitialState extends CounterState {}

class CounterIncrementState extends CounterState {
  final int value;

  CounterIncrementState({required this.value});
}

class CounterResetState extends CounterActionState {}
