// ignore_for_file: prefer_const_constructors

import 'package:e_shop/common/styles/spacing_style.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
    backgroundColor: Colors.black,

    body: SingleChildScrollView(
      child: Padding(padding: ESpacingStyle.paddingWithAppBarHeight),
    )
    );
  }
}