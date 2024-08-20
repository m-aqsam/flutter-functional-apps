part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  // final ProductDataModel clickedProduct;

  //HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartNavigateButtonClickedEvent extends HomeEvent {}
