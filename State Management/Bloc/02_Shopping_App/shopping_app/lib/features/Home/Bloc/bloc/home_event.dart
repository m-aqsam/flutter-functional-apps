part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel wishlistProduct;

  HomeProductWishlistButtonClickedEvent({required this.wishlistProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel carProduct;

  HomeProductCartButtonClickedEvent({required this.carProduct});
}

class HomeWishlistNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartNavigateButtonClickedEvent extends HomeEvent {}
