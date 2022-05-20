import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_fetching_flutter/models/covid_model.dart';
import 'package:bloc_api_fetching_flutter/resources/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  int currentIndex = 0;

  CovidBloc() : super(CovidInitial()) {
    on<CovidEvent>((event, emit) async {
      if (event is GetCovidList) {
        final ApiRepository _apiRepository = ApiRepository();

        try {
          emit(CovidLoading());
          final mList = await _apiRepository.fetchCovidList();
          emit(CovidLoaded(mList));
          if (mList.error != null) {
            emit(CovidError(mList.error));
          }
        } on NetworkError {
          emit(CovidError("Failed to fetch data. is your device online?"));
        }
      } else if (event is IncrementCountValueEvent) {
        emit(IncrementValueState(currentIndex: currentIndex++));
      }
    });
  }
}
