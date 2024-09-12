// ignore_for_file: prefer_const_constructors

import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/device/device_utlis.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Smooth_Page_Indicator extends StatelessWidget {
  final PageController pageController;
  const Smooth_Page_Indicator({
    super.key,
    required this.pageController,
  });
  //

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: EDeviceUtlis.getBottomNavigationBarHeight(),
        left: 30,
        child: SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? EColors.light : EColors.dark,
            dotColor: EColors.darkGrey,
            dotHeight: 8,
          ),
          //
        ));
  }
}
