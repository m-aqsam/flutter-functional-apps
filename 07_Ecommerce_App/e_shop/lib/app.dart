// ignore_for_file: prefer_const_constructors

import 'package:e_shop/utlis/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
      ),
      themeMode: ThemeMode.system,
      theme: EShopTheme.lightTheme,
      darkTheme: EShopTheme.darkTheme,
    );
  }
}
