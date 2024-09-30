// ignore_for_file: prefer_const_constructors

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
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(
            side: BorderSide(),
          ),
        ),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
  //
}
