// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_application/services/auth/Auth_Gate.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo

            Image.asset(
              'lib/assets/QuickChat app icon.png',
              height: 170,
            ),

            SizedBox(height: 30),

            // heading

            Text(
              "QucikChat",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // description

            Text(
              "The ultimate chatting app designed to \nenhance your communication \nexperience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 30),

            // slide to act

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SlideAction(
                elevation: 0,
                borderRadius: 12,
                innerColor: Colors.green,
                outerColor: Colors.black,
                text: "Slide to Start",
                textColor: Colors.white,
                onSubmit: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthGate(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
