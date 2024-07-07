import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/Home_Page.dart';
import 'package:firebase_authentication/pages/Login_Page.dart';
import 'package:flutter/material.dart';

class Auth_Page extends StatelessWidget {
  const Auth_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in

          if (snapshot.hasData) {
            return Home_Page();
          } else {
            return Login_Page();
          }

          // user not logged in
        },
      ),
    );
  }
}
