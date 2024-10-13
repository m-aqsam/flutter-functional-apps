// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/common/styles/spacing_style.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Success_Screen extends StatelessWidget {
  final String image;
  final String tittle;
  final String description;
  final void Function()? onPressed;
  Success_Screen({
    super.key,
    required this.image,
    required this.tittle,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //***************  Image ***************
              Image(
                width: EHelperFunctions.screenWidth() * 0.6,
                image: AssetImage(image),
              ),

              //***************  Tittle ***************
              Text(
                tittle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              //***************  Description ***************
              Text(
                description,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              //***************  Button ***************

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(ETexts.verifyEmailContinueButton)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
