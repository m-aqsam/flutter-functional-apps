// ignore_for_file: prefer_const_constructors

import 'package:chat_application/services/auth/Auth_Service.dart';
import 'package:chat_application/components/My_Button.dart';
import 'package:chat_application/components/My_TextField.dart';
import 'package:flutter/material.dart';

class Register_Page extends StatefulWidget {
  final void Function()? onTap;
  Register_Page({
    super.key,
    required this.onTap,
  });

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  //  Text Editing Controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  // register Method
  Future<void> register(BuildContext context) async {
    // auth service instance
    final AuthService _auth = AuthService();

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

    // register method
    if (passwordController.text == confirmpasswordController.text) {
      try {
        await _auth.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
        Navigator.pop(context); // Pop the loading circle
      } catch (e) {
        Navigator.pop(context); // Pop the loading circle
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
    // password not match

    else {
      Navigator.pop(context); // Pop the loading circle
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Passwords don't Match"),
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
                "Let's create an account for you !",
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
              SizedBox(height: 10),

              // Confirm Password TextField
              My_TextField(
                hintText: "Confirm Password",
                obsecureText: true,
                controller: confirmpasswordController,
              ),

              SizedBox(height: 20),

              // Login Button

              My_Button(
                onTap: () => register(context),
                btnText: "Register",
              ),

              SizedBox(height: 20),

              // register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now ",
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
