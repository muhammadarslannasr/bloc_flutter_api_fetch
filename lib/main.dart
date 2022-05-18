import 'package:bloc_api_fetching_flutter/page/covid_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid List",
      debugShowCheckedModeBanner: false,
      home: CovidPage(),
    );
  }
}
