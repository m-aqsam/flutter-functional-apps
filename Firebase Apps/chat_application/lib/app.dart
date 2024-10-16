import 'package:chat_application/pages/Splash_Screen.dart';
import 'package:chat_application/theme/Theme_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
