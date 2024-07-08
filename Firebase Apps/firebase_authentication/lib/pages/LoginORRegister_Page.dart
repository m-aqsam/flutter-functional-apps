// ignore_for_file: camel_case_types

import 'package:firebase_authentication/pages/Login_Page.dart';
import 'package:firebase_authentication/pages/Register_Page.dart';
import 'package:flutter/material.dart';

class LoginORRegister_Page extends StatefulWidget {
  const LoginORRegister_Page({super.key});

  @override
  State<LoginORRegister_Page> createState() => _LoginORRegister_PageState();
}

class _LoginORRegister_PageState extends State<LoginORRegister_Page> {
  // initially the show login page

  bool showLoginPage = true;

  // toggle b/w login and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login_Page(onTap: togglePages);
    } else {
      return Register_Page(onTap: togglePages);
    }
  }
}
