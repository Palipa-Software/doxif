import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/constants/custom_firebase_manager.dart';

class HomeScreenController extends GetxController {
  final Stream<QuerySnapshot<Object?>>? stream =
      CustomFirebaseManager.stream3("allRegions", "regions");
  // DatabaseReference realtimeDatabaseReference =
  //     FirebaseDatabase.instance.ref("SNB/1222104");

  final databaseRef = FirebaseDatabase.instance.ref("SNB/1222104");
  RxString nem = ''.obs;
  RxString temperature = "".obs;

  @override
  void onInit() {
    databaseRef.child('nem').onValue.listen((event) {
      nem.value = event.snapshot.value.toString();
    });
    databaseRef.child('sicaklik').onValue.listen((event) {
      temperature.value = event.snapshot.value.toString();
    });

    super.onInit();
  }

  var plantName = "".obs;
  var imagePath = "".obs;
}
