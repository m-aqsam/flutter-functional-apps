part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class RemoveFromCartState extends CartActionState {}
