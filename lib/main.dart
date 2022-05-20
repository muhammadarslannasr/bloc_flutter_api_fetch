import 'package:bloc_api_fetching_flutter/app.dart';
import 'package:bloc_api_fetching_flutter/bloc/counter_bloc.dart';
import 'package:bloc_api_fetching_flutter/bloc/covid_bloc.dart';
import 'package:bloc_api_fetching_flutter/counter_observer.dart';
import 'package:bloc_api_fetching_flutter/page/covid_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
      () => runApp(
            MultiBlocProvider(
              providers: [
                BlocProvider<CovidBloc>(
                  create: (context) => CovidBloc(),
                ),
                BlocProvider<CounterBloc>(
                  create: (context) => CounterBloc(),
                ),
              ],
              child: CovidApp(),
            ),
          ),
      blocObserver: CounterObserver());
}
