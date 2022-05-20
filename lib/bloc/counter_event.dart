part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class IncrementEvent extends CounterEvent {}
