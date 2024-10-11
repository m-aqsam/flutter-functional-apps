// ignore_for_file: prefer_const_constructors

import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUp_Form extends StatelessWidget {
  const SignUp_Form({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ETexts.signUpFirstName,
                    hintText: ETexts.signUpFirstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ETexts.signUpLastName,
                    hintText: ETexts.signUpLastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Username

          TextFormField(
            decoration: InputDecoration(
              labelText: ETexts.signUpUserName,
              hintText: ETexts.signUpUserName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),

          SizedBox(height: 20),

          // Email

          TextFormField(
            decoration: InputDecoration(
              labelText: ETexts.signUpEmail,
              hintText: ETexts.signUpEmail,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          SizedBox(height: 20),

          // Phone Number

          TextFormField(
            decoration: InputDecoration(
              labelText: ETexts.signUpPhoneNumber,
              hintText: ETexts.signUpPhoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          SizedBox(height: 20),

          // Password

          TextFormField(
            decoration: InputDecoration(
              labelText: ETexts.signUpPassword,
              hintText: ETexts.signUpPassword,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
        ],
      ),
    );
  }
}
