// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/Home/Bloc/bloc/home_bloc.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // buildWhen: (previous, current) {

      // },

      // listenWhen: (previous, current) {

      // },
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: Text("Shopping App"),
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
        );
      },
    );
  }
}
