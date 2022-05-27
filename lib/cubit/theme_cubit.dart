import 'package:bloc/bloc.dart';
import 'package:bloc_api_fetching_flutter/theme/themeData.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkThemeOn: false));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}
