import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/Data/Cart_Item_List.dart';
import 'package:shopping_app/features/Home/Models/Grocery_Model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveProductFromCart>(removeProductFromCart);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartList));
  }

  FutureOr<void> removeProductFromCart(
      RemoveProductFromCart event, Emitter<CartState> emit) {
    emit(RemoveFromCartState());
    cartList.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartList));
  }
}
