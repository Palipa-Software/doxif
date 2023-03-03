import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomFirebaseManager {
  static Stream<QuerySnapshot<Object?>>? stream(String collectionName) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .map((snapshot) {
      snapshot.docs.map((doc) => doc.data()).toList();
      return snapshot;
    });
  }

  static Stream<QuerySnapshot<Object?>>? customStream(
    String collectionName,
  ) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(auth.currentUser!.uid.toString())
        .collection("regions")
        .snapshots();
  }

  static Stream<QuerySnapshot<Object?>>? stream3(
      String collectionName, String collectionName2, userId) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(userId)
        .collection(collectionName2)
        .snapshots()
        .map((snapshot) {
      snapshot.docs.map((doc) => doc.data()).toList();
      return snapshot;
    });
  }
}
