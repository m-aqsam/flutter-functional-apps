// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/Home_Page.dart';
import 'package:habit_tracker/theme/Dark_Mode.dart';
import 'package:habit_tracker/theme/Light_Mode.dart';
import 'package:habit_tracker/theme/Theme_Perovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
