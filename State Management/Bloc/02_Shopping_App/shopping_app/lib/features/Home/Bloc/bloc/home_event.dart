part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishlistNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartNavigateButtonClickedEvent extends HomeEvent {}
