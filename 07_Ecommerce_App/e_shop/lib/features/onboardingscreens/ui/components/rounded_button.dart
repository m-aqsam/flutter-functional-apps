// ignore_for_file: prefer_const_constructors

import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/device/device_utlis.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Rounded_Button extends StatelessWidget {
  void Function()? onTap;
  Rounded_Button({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 38,
        right: 30,
        child: ElevatedButton(
          onPressed: onTap,
          child: Icon(Iconsax.arrow_right_3),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(),
            ),
          ),
        ));
  }
}
