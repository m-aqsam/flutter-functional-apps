// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase_authentication/components/IconTile.dart';
import 'package:firebase_authentication/components/MyButton.dart';
import 'package:firebase_authentication/components/MyTextField.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final email_Controller = TextEditingController();
  final password_Controller = TextEditingController();

  void signUserIn() {}

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
                  "Welcome back you've been missed !",
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
                  obscureText: true,
                ),

                SizedBox(height: 10),

                // Forgot Password

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                // Sign In Button

                MyButton(
                  onTap: signUserIn,
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
                    Text("Not a member?"),
                    SizedBox(width: 6),
                    Text(
                      "Register now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
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
