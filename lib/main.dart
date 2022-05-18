import 'package:bloc_api_fetching_flutter/app.dart';
import 'package:bloc_api_fetching_flutter/counter_observer.dart';
import 'package:bloc_api_fetching_flutter/page/covid_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(CovidApp()),
    blocObserver: CounterObserver(),
  );
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Covid List",
//       debugShowCheckedModeBanner: false,
//       home: CovidPage(),
//     );
//   }
// }
