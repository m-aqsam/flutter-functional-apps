// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/Cart/Bloc/bloc/cart_bloc.dart';
import 'package:shopping_app/features/Cart/ui/Cart_Tile_Widget.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({super.key});

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final cartSuccess = state as CartSuccessState;

              return ListView.builder(
                itemCount: cartSuccess.cartItems.length,
                itemBuilder: (context, index) => CartTileWidget(
                  productDataModel: cartSuccess.cartItems[index],
                  cartBloc: cartBloc,
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
