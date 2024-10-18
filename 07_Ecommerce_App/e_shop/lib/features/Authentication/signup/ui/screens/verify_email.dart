// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/common/styles/spacing_style.dart';
import 'package:e_shop/common/widgets/succes_screen.dart';
import 'package:e_shop/features/Authentication/login/ui/screens/login_screen.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Verify_Email_Screen extends StatelessWidget {
  const Verify_Email_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login_Screen(),
                  ));
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //***************  Image ***************

              Image(
                width: EHelperFunctions.screenWidth() * 0.6,
                image: AssetImage(EImages.animationEmailVerified),
              ),

              //***************  Tittle $ Subtitle ***************
              Text(
                ETexts.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'contact.maqsam@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16),

              //***************  Description ***************

              Text(
                ETexts.verifyEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              //***************  Buttons ****************

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success_Screen(
                              image: EImages.animationAccountCreated,
                              tittle: ETexts.successScreenTitle,
                              description: ETexts.successScreenDescription,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_Screen()),
                                );
                              },
                            ),
                          ));
                    },
                    child: Text(ETexts.verifyEmailContinueButton)),
              ),

              // Email Resend Button

              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: Text(ETexts.verifyEmailResend)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
