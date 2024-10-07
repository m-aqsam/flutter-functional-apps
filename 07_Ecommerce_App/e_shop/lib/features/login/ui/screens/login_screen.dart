// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:e_shop/common/styles/spacing_style.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:e_shop/utlis/theme/custom_themes/text_theme.dart';
import 'package:e_shop/utlis/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utlis/theme/custom_themes/text_theme.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //***************  Logo + Heading + Description ***************

                  Image(
                    height: 110,
                    image: AssetImage(
                      EImages.eshopLogo,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(ETexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),

                  SizedBox(height: 8),

                  Text(ETexts.loginSubTitle,
                      style: TextStyle(
                        color: EColors.darkGrey,
                      )),
                  SizedBox(height: 30),

                  //*********************  Form *********************

                  Form(
                    child: Column(
                      children: [
                        //* Email Field
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: ETexts.loginEmail,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                        SizedBox(height: 16),

                        //* Password Field
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: ETexts.loginPassword,
                              prefixIcon: Icon(Iconsax.lock),
                              suffixIcon: Icon(Iconsax.eye_slash)),
                        ),
                        SizedBox(height: 6),

                        // *********************  Forgot Password *********************

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                Text(ETexts.loginRememberMe),
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  ETexts.loginForgotPassword,
                                )),
                          ],
                        ),
                        SizedBox(height: 20),

                        // *********************  Login Button *********************
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(ETexts.loginButton),
                          ),
                        ),
                        SizedBox(height: 16),
                        //* Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(ETexts.createAccount),
                          ),
                        ),
                        SizedBox(height: 20),

                        // *********************  Divider *********************

                        Row(
                          children: [
                            Flexible(
                              child: Divider(color: dark? EColors.grey : EColors.darkGrey,
                              thickness: 0.5,endIndent: 8,indent: 40,),
                            ),
                            Text(ETexts.orSignUpWith),
                            Flexible(
                              child: Divider(color: dark? EColors.grey : EColors.darkGrey,
                              thickness: 0.5,endIndent: 40,indent: 8,),
                            ),
                          ],
                        ),

                        

                        // *********************  Sign up With *********************
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
