// ignore_for_file: prefer_const_constructors, unused_field, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_online_database/services/Firestore_Services.dart';
import 'package:notes_app_online_database/theme/Theme_Provider.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  // acces FirestoreService class

  final FirestoreService firestoreService = FirestoreService();

// TextField Controller

  final TextEditingController txtController = new TextEditingController();
  // open input dialogue box

  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: txtController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // add note to database
              if (docID == null) {
                firestoreService.addNote(txtController.text);
              }

              // update existing note

              else {
                firestoreService.updateNote(docID, txtController.text);
              }

              // clear text field

              txtController.clear();

              // close dialogue box

              Navigator.pop(context);
            },
            child: Text(docID == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }

  // Delete alert Dialogue

  void deleteAlert({String? docID}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Warning"),
          content: Text("Do You want to Delete Your Note "),
          actions: [
            ElevatedButton(
              onPressed: () {
                firestoreService.deleteNote(docID!);
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "SnapNotes",
          style: GoogleFonts.oxygen(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => openNoteBox(),
        child: Icon(Icons.add),
      ),

      // Drawer

      drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text

                SizedBox(height: 340),
                // toggle (Dark/light)
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                ),
                SizedBox(height: 10),
                // text
                Text(
                  "Share notes with your friend's. ",
                ),
                SizedBox(height: 340),

                Divider(),
                SizedBox(height: 10),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Design and dev by @aqsam",
                  ),
                ),

                // text design and dev
              ],
            ),
          )),

      // body

      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNoteStream(),
        builder: (context, snapshot) {
          // if we have data , get all docs
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            // display as a list

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                //get each individual docs

                DocumentSnapshot document = noteList[index];
                String docID = document.id;

                // get note from each document

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                // return as a tile

                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: Text(
                      noteText,
                      //style: GoogleFonts.robotoMono(),
                      //style: GoogleFonts.inconsolata(),
                      //style: GoogleFonts.ibmPlexMono(),
                      //style: GoogleFonts.asap(),
                      style: GoogleFonts.schibstedGrotesk(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      //style: GoogleFonts.nanumGothic(),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // update btn
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: Icon(Icons.settings),
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),

                        // delete btn

                        IconButton(
                          onPressed: () => deleteAlert(docID: docID),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ],
                    ),
                    tileColor: Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            );
          } else {
            return Text("No Notes ... !");
          }
        },
      ),
    );
  }
}
