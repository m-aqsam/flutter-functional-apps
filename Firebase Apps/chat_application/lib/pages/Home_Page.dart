// ignore_for_file: prefer_const_constructors

import 'package:chat_application/components/My_Drawer.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: My_Drawer(),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
