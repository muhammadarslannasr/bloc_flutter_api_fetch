import 'package:bloc_api_fetching_flutter/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Text(
              'Profile Tab Screen',
              style: TextStyle(
                color: state.isDarkThemeOn ? Colors.white : Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
