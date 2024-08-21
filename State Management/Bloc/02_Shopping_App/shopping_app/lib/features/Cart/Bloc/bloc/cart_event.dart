part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveProductFromCart extends CartEvent {
  final ProductDataModel productDataModel;

  RemoveProductFromCart({required this.productDataModel});
}
