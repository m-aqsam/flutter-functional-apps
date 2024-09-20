// ignore_for_file: prefer_const_constructors

import 'package:e_shop/features/onboardingscreens/ui/screens/OnBoardingScreens.dart';
import 'package:e_shop/utlis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application...
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      themeMode: ThemeMode.system,
      theme: EShopTheme.lightTheme,
      darkTheme: EShopTheme.darkTheme,
    );
  }
}
