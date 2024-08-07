import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCartNavigateButtonClickedEvent>(homeCartNavigateButtonClickedEvent);
    on<HomeWishlistNavigateButtonClickedEvent>(
        homeWishlistNavigateButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
  }

  FutureOr<void> homeCartNavigateButtonClickedEvent(
      HomeCartNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Button Clicked");
  }

  FutureOr<void> homeWishlistNavigateButtonClickedEvent(
      HomeWishlistNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Navigate Button Clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {}
}
