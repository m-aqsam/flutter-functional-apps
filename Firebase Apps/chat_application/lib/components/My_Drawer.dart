// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_application/pages/About_Page.dart';
import 'package:chat_application/services/auth/Auth_Service.dart';
import 'package:chat_application/pages/Settings_Page.dart';
import 'package:flutter/material.dart';

class My_Drawer extends StatelessWidget {
  const My_Drawer({super.key});

  // Log Out Method

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("You want to logged out your account ? "),
          actions: [
            ElevatedButton(
              onPressed: () {
                AuthService _auth = AuthService();
                _auth.signOut();
                Navigator.pop(context);
              },
              child: Text("Yes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo

              DrawerHeader(
                  child: Icon(
                Icons.message_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 50,
              )),

              SizedBox(height: 12),

              // home list tile

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: Text(
                    "H O M E",
                  ),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // setting list tile

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  title: Text(
                    "S E T T I N G S",
                  ),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings_Page(),
                        ));
                  },
                ),
              ),

              // About App

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                    title: Text(
                      "A B O U T",
                    ),
                    leading: Icon(Icons.info),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => About_Page(),
                          ));
                    }),
              ),
            ],
          ),

          // logout

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              title: Text(
                "L O G O U T",
              ),
              leading: Icon(Icons.logout_rounded),
              //tileColor: Colors.red.shade400,
              contentPadding: EdgeInsets.only(left: 40),
              onTap: () => logout(context),
            ),
          ),
        ],
      ),
    );
  }
}
