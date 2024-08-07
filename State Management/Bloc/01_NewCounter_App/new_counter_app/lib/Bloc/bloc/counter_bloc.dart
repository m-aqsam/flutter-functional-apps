import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    on<IncrementButtonClickedEvent>(incrementButtonClickedEvent);
    on<DecrementButtonClickedEvent>(decrementButtonClickedEvent);
  }

  FutureOr<void> incrementButtonClickedEvent(
      IncrementButtonClickedEvent event, Emitter<CounterState> emit) {
    final newCounter = state.counter + 1;
    emit(CounterValue(newCounter));
  }

  FutureOr<void> decrementButtonClickedEvent(
      DecrementButtonClickedEvent event, Emitter<CounterState> emit) {
    if (state.counter == 0) {
      return null;
    }
    final newCounter = state.counter - 1;
    emit(CounterValue(newCounter));
  }
}
