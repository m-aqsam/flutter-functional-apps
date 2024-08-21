import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/Data/WishList_Items_List.dart';
import 'package:shopping_app/features/Home/Models/Grocery_Model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveProductFromWishlistEvent>(removeProductFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistList));
  }

  FutureOr<void> removeProductFromWishlistEvent(
      RemoveProductFromWishlistEvent event, Emitter<WishlistState> emit) {
    emit(RemoveProductFromWishlistState());
    wishlistList.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistItems: wishlistList));
  }
}
