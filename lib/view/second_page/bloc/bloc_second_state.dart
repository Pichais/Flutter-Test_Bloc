// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  int counter;
  CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

class CounterUpdate extends CounterState {
  CounterUpdate(int count) : super(counter: count);
}
