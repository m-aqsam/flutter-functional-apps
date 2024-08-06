part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counter;
  CounterState(this.counter);
}

final class CounterInitial extends CounterState {
  CounterInitial(int counter) : super(counter);
}

final class CounterValue extends CounterState {
  CounterValue(int counter) : super(counter);
}
