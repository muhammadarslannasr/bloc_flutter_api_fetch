import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(IncrementCountState(counter: 0)) {
    int currentIndex = 0;

    on<CounterEvent>((event, emit) {
      if (event is IncrementEvent) {
        emit(IncrementCountState(counter: currentIndex + 1));
        print('Its Updating');
      }
    });
  }


}
