// ignore_for_file: prefer_const_constructors

import 'package:e_shop/utlis/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Login App"),
        ),
      ),
      themeMode: ThemeMode.system,
      theme: EShopTheme.lightTheme,
      darkTheme: EShopTheme.darkTheme,
    );
  }
}
