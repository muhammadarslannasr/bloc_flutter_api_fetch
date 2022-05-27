import 'package:bloc_api_fetching_flutter/cubit/navigation_cubit.dart';
import 'package:bloc_api_fetching_flutter/cubit/navigation_cubit.dart';
import 'package:bloc_api_fetching_flutter/enu/nav_bar_items.dart';
import 'package:bloc_api_fetching_flutter/page/tabs_screens/home_screen.dart';
import 'package:bloc_api_fetching_flutter/page/tabs_screens/profile_screen.dart';
import 'package:bloc_api_fetching_flutter/page/tabs_screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return Text('Home');
            } else if (state.navbarItem == NavbarItem.settings) {
              return Text('Settings');
            } else if (state.navbarItem == NavbarItem.profile) {
              return Text('Profile');
            }
            return Text('');
          },
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return HomeScreen();
        } else if (state.navbarItem == NavbarItem.settings) {
          return SettingsScreen();
        } else if (state.navbarItem == NavbarItem.profile) {
          return ProfileScreen();
        }
        return Container();
      }),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.settings);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
              }
            },
          );
        },
      ),
    );
  }
}
