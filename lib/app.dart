import 'package:bloc_api_fetching_flutter/page/covid_page.dart';
import 'package:flutter/material.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
class CovidApp extends MaterialApp {
  /// {@macro counter_app}
  CovidApp({Key? key}) : super(key: key, home: CovidPage());
}