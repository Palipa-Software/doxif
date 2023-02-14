import 'package:cloud_firestore/cloud_firestore.dart';

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
}
