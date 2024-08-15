// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Wishlist_Page extends StatefulWidget {
  const Wishlist_Page({super.key});

  @override
  State<Wishlist_Page> createState() => _Wishlist_PageState();
}

class _Wishlist_PageState extends State<Wishlist_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("WishList"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
