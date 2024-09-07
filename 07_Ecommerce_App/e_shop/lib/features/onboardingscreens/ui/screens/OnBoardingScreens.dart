// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/features/onboardingscreens/ui/components/on_boarding_page.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //*  PageView

          PageView(
            children: [
              //  First Page

              OnBoardingPage(
                image: EImages.onBoardingImage1,
                text: ETexts.onBoardingTitle1,
                subText: ETexts.onBoardingSubTitle1,
              ),
              //  Second Page

              OnBoardingPage(
                image: EImages.onBoardingImage2,
                text: ETexts.onBoardingTitle2,
                subText: ETexts.onBoardingSubTitle2,
              ),
              //  3rd Page

              OnBoardingPage(
                image: EImages.onBoardingImage3,
                text: ETexts.onBoardingTitle3,
                subText: ETexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //* Skip Button

          //* Dot NAvigation SmoothPAgeIndicator

          //* Rounded Button
        ],
      ),
    );
  }
}
