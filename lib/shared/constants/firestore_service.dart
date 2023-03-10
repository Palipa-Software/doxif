import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seramcepte/shared/constants/data_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Data>> getStreamData() {
    return _db
        .collection('allRegions')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("regions")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Data.fromFirestore(doc)).toList());
  }
}
