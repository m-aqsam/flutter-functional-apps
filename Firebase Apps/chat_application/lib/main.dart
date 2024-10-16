// ignore_for_file: prefer_const_constructors

import 'package:chat_application/app.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/theme/Theme_Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}


  // * Built using Flutter with ❤️ by Aqsam.
  // ! Give Your Feedback
  // ? Got any question
  // Todo: Let's Connect