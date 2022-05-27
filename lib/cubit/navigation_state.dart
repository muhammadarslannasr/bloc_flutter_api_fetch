part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  NavigationState({required this.navbarItem, required this.index});

  @override
  List<Object> get props => [this.navbarItem, this.index];
}
