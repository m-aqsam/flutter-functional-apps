import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterInitialEvent>(counterInitialEvent);
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterResetEvent>(counterResetEvent);
  }
  int value = 0;

  FutureOr<void> counterInitialEvent(
      CounterInitialEvent event, Emitter<CounterState> emit) {
    value = 0;
    emit(CounterIncrementState(value: value));
  }

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    value = value + 1;
    emit(CounterIncrementState(value: value));
  }

  FutureOr<void> counterResetEvent(
      CounterResetEvent event, Emitter<CounterState> emit) {
    value = 0;
    emit(CounterResetState());
    emit(CounterIncrementState(value: value));
  }
}
