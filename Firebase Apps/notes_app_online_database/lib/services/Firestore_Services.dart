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

  Stream<QuerySnapshot> getNoteStream() {
    final noteStream = notes.orderBy('timestamp', descending: true).snapshots();
    return noteStream;
  }

  // Update : update note

  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete : delete note from database

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
