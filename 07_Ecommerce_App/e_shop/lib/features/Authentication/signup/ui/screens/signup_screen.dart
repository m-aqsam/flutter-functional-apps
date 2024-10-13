// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/common/styles/spacing_style.dart';
import 'package:e_shop/common/widgets/form_divider.dart';
import 'package:e_shop/common/widgets/social_icons.dart';
import 'package:e_shop/features/Authentication/signup/ui/components/Privacy_policy_text.dart';
import 'package:e_shop/features/Authentication/signup/ui/components/signup_form.dart';
import 'package:e_shop/features/Authentication/signup/ui/screens/verify_email.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check Dark Mode
    final dark = EHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: ESpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //***************  Tittle ***************
                Text(
                  ETexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                SizedBox(height: 24),

                //***************  Form ***************
                SignUp_Form(),

                SizedBox(height: 24),

                // *******************  Privacy Policy $ Term of use *******************

                Privacy_Policy_Text(),

                SizedBox(height: 24),

                // *******************  Sign Up Button *******************

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verify_Email_Screen(),
                          ));
                    },
                    child: Text(ETexts.signUpCreateAccount),
                  ),
                ),

                SizedBox(height: 24),

                // *******************  Or Sign Up With ******************

                Form_Divider(text: ETexts.orSignUpWith),

                SizedBox(height: 24),

                // ******************  Social Icons *******************

                Social_Icons(
                  onGooglePressed: () {},
                  onFacebookPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
