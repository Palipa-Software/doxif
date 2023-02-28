import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../shared/constants/custom_firebase_manager.dart';

class HomeScreenController extends GetxController {
  final Stream<QuerySnapshot<Object?>>? stream = CustomFirebaseManager.stream3("allRegions", "regions");

  // DatabaseReference realtimeDatabaseReference =
  //     FirebaseDatabase.instance.ref("SNB/1222104");
  String sensorId = "";
  final databaseRef = FirebaseDatabase.instance.ref("SNB/1222104");

  RxString nem = ''.obs;
  List<String> temperatures = [];
  RxString temperature = "".obs;
  var firebaseAuth = FirebaseAuth.instance;

  Future<void> getSensorIds() async {
    var sensor =
        FirebaseFirestore.instance.collection("allRegions").doc(firebaseAuth.currentUser!.uid).collection("regions");
    var sensorId = await sensor.get();
    var regions = sensorId.docs;
    for (var element in regions) {
      Map<String, dynamic>? sensorsId = element.data();
      temperatures.add(sensorsId["sensorId"]);
      print(temperatures);
    }
  }

  @override
  void onInit() {
    getSensorIds();
    print(FirebaseDatabase.instance.ref("SNB/").child("1222104/sicaklik").toString());
    super.onInit();
  }

  var plantName = "".obs;
  var imagePath = "".obs;
}
