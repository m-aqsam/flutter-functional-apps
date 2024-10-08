// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/features/Authentication/login/ui/screens/login_screen.dart';
import 'package:e_shop/features/onboardingscreens/ui/components/on_boarding_page.dart';
import 'package:e_shop/features/onboardingscreens/ui/components/rounded_button.dart';
import 'package:e_shop/features/onboardingscreens/ui/components/skip_button.dart';
import 'package:e_shop/features/onboardingscreens/ui/components/smooth_page_indicator.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //*  PageView

          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              //  1st Page

              OnBoardingPage(
                image: EImages.onBoardingImage1,
                text: ETexts.onBoardingTitle1,
                subText: ETexts.onBoardingSubTitle1,
              ),
              //  2nd Page

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

          SkipButton(
            onTAp: () {
              _controller.jumpToPage(2);
            },
          ),

          //* Dot Navigation SmoothPageIndicator

          Smooth_Page_Indicator(
            pageController: _controller,
          ),

          //* Rounded Button

          Rounded_Button(onTap: () {
            if (currentIndex == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login_Screen()),
              );
            } else {
              _controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            }
          }),
        ],
      ),
    );
  }
}
