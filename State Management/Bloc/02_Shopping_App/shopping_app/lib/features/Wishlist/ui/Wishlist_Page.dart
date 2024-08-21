// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/Wishlist/Bloc/bloc/wishlist_bloc.dart';
import 'package:shopping_app/features/Wishlist/ui/Wishlist_Tile_Widget.dart';

class Wishlist_Page extends StatefulWidget {
  const Wishlist_Page({super.key});

  @override
  State<Wishlist_Page> createState() => _Wishlist_PageState();
}

class _Wishlist_PageState extends State<Wishlist_Page> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("WishList"),
        backgroundColor: Colors.pink,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is RemoveProductFromWishlistState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Product Remove From Wishlist")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final wishlistSuccess = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: wishlistSuccess.wishlistItems.length,
                itemBuilder: (context, index) => WishlistTileWidget(
                  productDataModel: wishlistSuccess.wishlistItems[index],
                  wishlistBloc: wishlistBloc,
                ),
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}
