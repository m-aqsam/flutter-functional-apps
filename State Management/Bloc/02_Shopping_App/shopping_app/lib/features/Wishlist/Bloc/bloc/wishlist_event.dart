part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveProductFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  RemoveProductFromWishlistEvent({required this.productDataModel});
}
