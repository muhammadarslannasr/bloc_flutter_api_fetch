part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class IncrementCountState extends CounterState {
  final int counter;
  IncrementCountState({required this.counter});

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
