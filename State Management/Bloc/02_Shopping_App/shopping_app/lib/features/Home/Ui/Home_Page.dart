// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/Cart/ui/Cart_Page.dart';
import 'package:shopping_app/features/Home/Bloc/bloc/home_bloc.dart';
import 'package:shopping_app/features/Home/Ui/ProductTileWidget.dart';
import 'package:shopping_app/features/Wishlist/ui/Wishlist_Page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart_Page(),
              ));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wishlist_Page(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case HomeLoadingSuccessState:
            final succesState = state as HomeLoadingSuccessState;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Shopping App"),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistNavigateButtonClickedEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartNavigateButtonClickedEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: succesState.products.length,
                itemBuilder: (context, index) => ProductTileWidget(
                  productDataModel: succesState.products[index],
                  homeBloc: homeBloc,
                ),
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error !!"),
              ),
            );

          default:
            return SizedBox(); //
        }
      },
    );
  }
}

/* 
    

*/
