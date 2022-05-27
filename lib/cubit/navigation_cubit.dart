import 'package:bloc/bloc.dart';
import 'package:bloc_api_fetching_flutter/enu/nav_bar_items.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState(navbarItem: NavbarItem.home, index: 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(navbarItem: NavbarItem.home, index: 0));
        break;
      case NavbarItem.settings:
        emit(NavigationState(navbarItem: NavbarItem.settings, index: 1));
        break;
      case NavbarItem.profile:
        emit(NavigationState(navbarItem: NavbarItem.profile, index: 2));
        break;
    }
  }
}
