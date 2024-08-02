// ignore_for_file: prefer_const_constructors

import 'package:counter_app/models/Counter_Model.dart';
import 'package:counter_app/pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home_Page(),
      ),
    );
  }
}
