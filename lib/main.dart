import 'package:bloc_api_fetching_flutter/app.dart';
import 'package:bloc_api_fetching_flutter/bloc/covid_bloc.dart';
import 'package:bloc_api_fetching_flutter/counter_observer.dart';
import 'package:bloc_api_fetching_flutter/cubit/counter_cubit.dart';
import 'package:bloc_api_fetching_flutter/cubit/navigation_cubit.dart';
import 'package:bloc_api_fetching_flutter/cubit/theme_cubit.dart';
import 'package:bloc_api_fetching_flutter/page/covid_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
  // BlocOverrides.runZoned(
  //     () => runApp(
  //           MultiBlocProvider(
  //             providers: [
  //               BlocProvider<CovidBloc>(
  //                 create: (context) => CovidBloc(),
  //               ),
  //               BlocProvider<CounterCubit>(
  //                 create: (context) => CounterCubit(),
  //               ),
  //               BlocProvider<NavigationCubit>(
  //                 create: (context) => NavigationCubit(),
  //               ),
  //               BlocProvider<ThemeCubit>(
  //                 create: (context) => ThemeCubit(),
  //               ),
  //             ],
  //             child: CovidApp(),
  //           ),
  //         ),
  //     blocObserver: CounterObserver());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            home: CovidPage(),
            title: 'Bloc',
            theme: state.theme,
          );
        },
      ),
    );

    // return BlocProvider<SwitchCubit>(
    //   create: (context) => SwitchCubit(),
    //   child: BlocBuilder<SwitchCubit, SwitchState>(
    //     builder: (context, state) {
    //       return MaterialApp(
    //         title: 'Flutter Demo',
    //         theme: state.theme,
    //         home: HomeScreen(),
    //       );
    //     },
    //   ),
    // );
  }
}
