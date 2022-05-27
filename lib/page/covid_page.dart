import 'dart:convert';

import 'package:bloc_api_fetching_flutter/bloc/covid_bloc.dart';
import 'package:bloc_api_fetching_flutter/cubit/theme_cubit.dart';
import 'package:bloc_api_fetching_flutter/models/covid_model.dart';
import 'package:bloc_api_fetching_flutter/page/counter_page.dart';
import 'package:bloc_api_fetching_flutter/page/tabs_screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final CovidBloc _newsBloc = CovidBloc();

  @override
  void initState() {
    Map<String, Map<String, dynamic>> map = {
      'data': {'data': 'test'}
    };

    print("Response Upload Object is: ${map}");

    _newsBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 List'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Switch(
                value: state.isDarkThemeOn,
                onChanged: (newValue) {
                  context.read<ThemeCubit>().toggleSwitch(newValue);
                },
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: Text('Change'),
        backgroundColor: new Color(0xFFE57373),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TabsScreen()));
        },
      ),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${model.countries![index].country}"),
                  Text(
                      "Total Confirmed: ${model.countries![index].totalConfirmed}"),
                  Text("Total Deaths: ${model.countries![index].totalDeaths}"),
                  Text(
                      "Total Recovered: ${model.countries![index].totalRecovered}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
