import 'dart:async';

import 'package:flutter_applicationtest/view/second_page/bloc/bloc_scond_event.dart';
import 'package:flutter_applicationtest/view/second_page/bloc/bloc_second_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSecondPage extends Bloc<CounterEvent, CounterState> {
  BlocSecondPage() : super(CounterInitial()) {
    on<IncrementCounter>(_onIncreadCounter);
    on<DecrementCounter>(_onDecreadCounter);
  }

  FutureOr<void> _onIncreadCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(CounterUpdate(state.counter + 1));
  }

  FutureOr<void> _onDecreadCounter(DecrementCounter event, Emitter<CounterState> emit) {
    emit(CounterUpdate(state.counter - 1));
  }
}
