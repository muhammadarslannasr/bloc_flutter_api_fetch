import 'package:bloc_api_fetching_flutter/app.dart';
import 'package:bloc_api_fetching_flutter/bloc/covid_bloc.dart';
import 'package:bloc_api_fetching_flutter/counter_observer.dart';
import 'package:bloc_api_fetching_flutter/cubit/counter_cubit.dart';
import 'package:bloc_api_fetching_flutter/cubit/navigation_cubit.dart';
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
                BlocProvider<CounterCubit>(
                  create: (context) => CounterCubit(),
                ),
                BlocProvider<NavigationCubit>(
                  create: (context) => NavigationCubit(),
                ),
              ],
              child: CovidApp(),
            ),
          ),
      blocObserver: CounterObserver());
}
