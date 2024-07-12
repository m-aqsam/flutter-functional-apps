import 'package:chat_application/pages/Login_Page.dart';
import 'package:chat_application/pages/Register_Page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister_Page extends StatefulWidget {
  const LoginOrRegister_Page({super.key});

  @override
  State<LoginOrRegister_Page> createState() => _LoginOrRegister_PageState();
}

class _LoginOrRegister_PageState extends State<LoginOrRegister_Page> {
  // show initial page

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
      return Login_Page(
        onTap: togglePages,
      );
    } else {
      return Register_Page(
        onTap: togglePages,
      );
    }
  }
}
