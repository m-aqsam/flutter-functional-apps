import 'package:chat_application/models/Message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('Users').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          //  go through each individual user

          final user = doc.data();

          // return user

          return user;
        }).toList();
      },
    );
  }

  // send message

  Future<void> sendMessage(String recieverID, message) async {
    // get current user info

    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timeStamp = Timestamp.now();

    // create a new message

    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      recieverID: recieverID,
      message: message,
      timestamp: timeStamp,
    );

    // construct chat room id for two users

    List<String> ids = [currentUserID, recieverID];
    ids.sort(); // sort the ids (ensure that the chatRoom id is same for the 2 persons)
    String chatRoomID = ids.join('_');

    // add message to the database

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get message

  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    // construct a chat room id for 2 users

    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
