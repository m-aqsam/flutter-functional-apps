// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/common/styles/spacing_style.dart';
import 'package:e_shop/features/Authentication/login/bloc/bloc/login_bloc.dart';
import 'package:e_shop/features/Authentication/signup/ui/screens/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_shop/common/widgets/form_divider.dart';
import 'package:e_shop/common/widgets/social_icons.dart';
import 'package:e_shop/utlis/constants/colors.dart';
import 'package:e_shop/utlis/constants/image_strings.dart';
import 'package:e_shop/utlis/constants/text_strings.dart';
import 'package:e_shop/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  // Bloc Initialize
  final LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return SafeArea(
      child: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listenWhen: (previous, current) => current is LoginActionState,
        buildWhen: (previous, current) => current is! LoginActionState,
        listener: (context, state) {
          if (state is LoginNavigateToLoginPageActionState) {
            //
          }

          if (state is LoginNavigateToCreateAccountPageActionState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signup_Screen(),
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                                    Checkbox(
                                        value: true, onChanged: (value) {}),
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
                            // *********************  Create Account Button *********************

                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  loginBloc.add(
                                      LoginCreateAccountNavigateClickedEvent());
                                },
                                child: Text(ETexts.createAccount),
                              ),
                            ),
                            SizedBox(height: 20),

                            // *********************  Divider *********************
                            Form_Divider(text: ETexts.orSignUpWith),

                            SizedBox(height: 20),

                            // **********************  Sign up With *********************

                            Social_Icons(
                              onGooglePressed: () {},
                              onFacebookPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
