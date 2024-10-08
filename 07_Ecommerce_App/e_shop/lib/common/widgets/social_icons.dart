// ignore_for_file: prefer_const_constructors

import 'package:e_shop/utlis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Social_Icons extends StatelessWidget {
  final void Function()? onGooglePressed;
  final void Function()? onFacebookPressed;
  const Social_Icons({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
    
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: onGooglePressed,
            icon: Image(
                image: AssetImage(
              "assets/logo/google_logo.png",
            )),
          ),
        ),
        SizedBox(width: 16),
        // Google Button
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed:onFacebookPressed,
            icon: Image(
                image: AssetImage(
              "assets/logo/facebook_logo.png",
            )),
          ),
        ),
      ],
    );
  }
}
