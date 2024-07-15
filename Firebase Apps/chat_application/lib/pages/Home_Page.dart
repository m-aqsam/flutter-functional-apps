// ignore_for_file: prefer_const_constructors

import 'package:chat_application/components/My_Drawer.dart';
import 'package:chat_application/components/User_Tile.dart';
import 'package:chat_application/pages/Chat_Page.dart';
import 'package:chat_application/services/auth/Auth_Service.dart';
import 'package:chat_application/services/chat/Chat_Service.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  Home_Page({super.key});

  // chat and auth service

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("QuickChat"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: My_Drawer(),
      body: _buildUserList(),
    );
  }

  // widget buildUserList

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // if error

        if (snapshot.hasError) {
          return Text("Error");
        }

        // loading ....

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }

        // return list view of users

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // Build individual list tile for each user

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all users except current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return User_Tile(
        text: userData['email'],
        onTap: () {
          // tap on user go to chat page
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chat_Page(
                  recieverEmail: userData['email'],
                  recieverID: userData['uid'],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
