// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Setting_Page extends StatelessWidget {
  const Setting_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S E T T I N G",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow[200],
      body: Center(
        child: Text(
          "Setting Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
