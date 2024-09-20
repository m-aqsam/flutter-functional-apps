// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SizedBox(
        height: 200,
        width: 200,
        //color: Colors.blue,
        child: Image.asset("lib/images/logo.png"),
      )),
    );
  }
}
