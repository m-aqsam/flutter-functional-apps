// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:typethis/typethis.dart';

class Animate_Chat_Temp extends StatelessWidget {
  final String text;

  Animate_Chat_Temp({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // profile

          CircleAvatar(
            backgroundImage: AssetImage('lib/assets/avatarmenew2.png'),
          ),

          SizedBox(width: 12),
          // type this
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TypeThis(
              string: text,
              speed: 200,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
