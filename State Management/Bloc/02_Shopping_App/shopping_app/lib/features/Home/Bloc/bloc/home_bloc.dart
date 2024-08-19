import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/Data/Grocery_Data.dart';
import 'package:shopping_app/features/Home/Models/Grocery_Model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartNavigateButtonClickedEvent>(homeCartNavigateButtonClickedEvent);
    on<HomeWishlistNavigateButtonClickedEvent>(
        homeWishlistNavigateButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));

    emit(HomeLoadingSuccessState(
      products: GroceryData.groceryProducts
          .map(
            (e) => ProductDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl'],
            ),
          )
          .toList(),
    ));
  }

  FutureOr<void> homeCartNavigateButtonClickedEvent(
      HomeCartNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Button Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistNavigateButtonClickedEvent(
      HomeWishlistNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Navigate Button Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Product Button Clicked");
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product Button Clicked");
  }
}
