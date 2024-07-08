// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/components/IconTile.dart';
import 'package:firebase_authentication/components/MyButton.dart';
import 'package:firebase_authentication/components/MyTextField.dart';
import 'package:flutter/material.dart';

class Register_Page extends StatefulWidget {
  final Function()? onTap;
  const Register_Page({
    super.key,
    required this.onTap,
  });

  @override
  State<Register_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Register_Page> {
  final email_Controller = TextEditingController();
  final password_Controller = TextEditingController();
  final confirmPassword_Controller = TextEditingController();
  // password is visible or not

  bool _isPasswordVisible = false;

  void signUserUp() async {
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

    try {
      // check the password and confirm pass are same

      if (password_Controller.text == confirmPassword_Controller.text) {
        // try to user sign in
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email_Controller.text,
          password: password_Controller.text,
        );
      }

      // else (error message)

      else {
        errroMessage("Password don't match !");
      }

      // pop the loading circle
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // await Future.delayed(Duration(milliseconds: 100)); // Add a small delay
      if (mounted) {
        Navigator.pop(context);
      }

      // show error

      errroMessage(e.code);
    }
  }

  // Wrong Email Alert Dialogue

  void errroMessage(String message) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.grey.shade700,
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                // Icon
                Icon(
                  Icons.lock,
                  size: 110,
                ),

                SizedBox(height: 30),

                // You Have been Missed

                Text(
                  "Let's create an account for you !",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                // Email Text Field

                MyTextField(
                  controller: email_Controller,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 15),

                // Password TextField

                MyTextField(
                  controller: password_Controller,
                  hintText: 'Password',
                  obscureText: !_isPasswordVisible,
                ),
                SizedBox(height: 15),

                // Confirm Password TextField

                MyTextField(
                  controller: confirmPassword_Controller,
                  hintText: 'Confirm Password',
                  obscureText: !_isPasswordVisible,
                ),

                //SizedBox(height: 10),

                // Text Button Show and Hide Password

                TextButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_isPasswordVisible ? "Hide Pass" : "Show Pass"),
                      ],
                    ),
                  ),
                ),

                // Sign In Button

                MyButton(
                  onTap: signUserUp,
                  text: "Sign Up",
                ),

                SizedBox(height: 30),

                // Or continue with

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or Continue with",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Google Logo / Apple Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconTile(imagePath: 'lib/images/google.png'),
                    SizedBox(width: 12),
                    IconTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account"),
                    SizedBox(width: 6),
                    InkWell(
                      onTap: () {
                        //
                      },
                      child: InkWell(
                        onTap: widget.onTap,
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
