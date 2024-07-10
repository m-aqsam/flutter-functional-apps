import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Get Collection of notes from Database

  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // Create : add a new note

  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  // Read : get note from Database

  // Update : update note

  // Delete : delete note from database
}
