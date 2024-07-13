// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:chat_application/services/auth/Auth_Service.dart';
import 'package:chat_application/components/My_Button.dart';
import 'package:chat_application/components/My_TextField.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  final void Function()? onTap;
  Login_Page({
    super.key,
    required this.onTap,
  });

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  //  Text Editing Controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // login Method
  void login(BuildContext context) async {
    // get Auth Service

    final AuthService _authSerice = AuthService();

    //loading circle

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try login

    try {
      await _authSerice.signInWithEmailPassword(
          emailController.text, passwordController.text);
      // pop the loading circle

      Navigator.pop(context);
    } catch (e) {
      // pop the loading circle

      Navigator.pop(context);
      // show error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon

              Icon(
                Icons.message_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 80,
              ),
              SizedBox(height: 20),

              // Text / Description

              Text(
                "Welcome back you've been missed !",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),

              // Email Textfield

              My_TextField(
                hintText: "Email",
                obsecureText: false,
                controller: emailController,
              ),

              SizedBox(height: 10),

              // Password TextField
              My_TextField(
                hintText: "Password",
                obsecureText: true,
                controller: passwordController,
              ),

              SizedBox(height: 20),

              // Login Button

              My_Button(
                onTap: () => login(context),
                btnText: "Login",
              ),

              SizedBox(height: 20),

              // register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member ? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
