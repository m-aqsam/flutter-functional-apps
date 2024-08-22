// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_counter_app/Features/Ui/Counter_Page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Counter_Page(),
    );
  }
}
