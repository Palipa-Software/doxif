import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:tutorai/modules/addRegion/addRegion.dart';

import '../../shared/constants/custom_firebase_manager.dart';

class HomeScreenController extends GetxController {
  final Stream<QuerySnapshot<Object?>>? stream = CustomFirebaseManager.stream3(
      "allRegions",
      "regions",
      FirebaseAuth.instance.currentUser!.uid.toString());

  // DatabaseReference realtimeDatabaseReference =
  //     FirebaseDatabase.instance.ref("SNB/1222104");
  String sensorId = "";

  RxString nem = ''.obs;
  RxList temperatures = [].obs;
  RxString temperature = "".obs;
  List<String> items = [];
  RxString query = "".obs;
  var firebaseAuth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Object?>>? stream3() {
    return FirebaseFirestore.instance
        .collection("allRegions")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("regions")
        .snapshots()
        .map((snapshot) {
      snapshot.docs.map((doc) => doc.data()).toList();
      return snapshot;
    });
  }

  Future<void> getSensorIds() async {
    var sensor = FirebaseFirestore.instance
        .collection("allRegions")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("regions");
    var sensorId = await sensor.get();
    var regions = sensorId.docs;
    for (var element in regions) {
      Map<String, dynamic>? sensorsId = element.data();
      temperatures.add(sensorsId["sensorId"]);
      items.add(sensorsId["regionName"]);
      print(temperatures);
    }
  }

  RxString userName = "".obs;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  var searchText = ''.obs;
  RxList results = [].obs;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      results.clear();
    }

    searchText.value = query;
    if (searchText.value != '') {
      searchText.value = searchText.value
          .replaceRange(0, 1, searchText.value[0].toUpperCase());
    }
    if (searchText.value.length >= 3) {
      await FirebaseFirestore.instance
          .collection('allRegions')
          .doc(firebaseAuth.currentUser!.uid)
          .collection("regions")
          .where('regionName',
              isGreaterThanOrEqualTo: capitalize(searchText.value))
          .where('regionName', isLessThan: query + 'z')
          .get()
          .then((snapshot) {
        results.value = snapshot.docs;
      });
    }
  }

  String capitalize(String s) {
    if (s == null || s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  void onInit() {
    getSensorIds();
    stream3();
    print(FirebaseDatabase.instance
        .ref("SNB/")
        .child("1222104/sicaklik")
        .toString());
    temperature.refresh();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getSensorIds();
    temperature.refresh();
  }

  var plantName = "".obs;
  var imagePath = "".obs;
}
