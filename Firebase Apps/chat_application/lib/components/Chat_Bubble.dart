// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Chat_Bubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  Chat_Bubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey[500],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 22),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
