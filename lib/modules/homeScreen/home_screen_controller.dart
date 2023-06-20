import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../shared/constants/data_model.dart';
import '../../shared/constants/firestore_service.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  String yesterday = DateFormat("yyyy-MM-dd").format(
    DateTime.now().subtract(
      const Duration(
        days: 1,
      ),
    ),
  );
  Map<String, dynamic> minMaxDatas = {};
  RxString highHumidity = ''.obs;
  RxString highTemp = ''.obs;
  RxString lowHumidity = ''.obs;
  RxString lowTemp = ''.obs;
  String sensorId = "";
  RxString nem = ''.obs;
  RxString query = "".obs;
  var searchText = ''.obs;
  RxList results = [].obs;
  var myDataList = <Data>[].obs;
  Map<String, dynamic> hoursData = {};
  Map<String, dynamic> weeklyData = {};
  var firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirestoreService firestoreService = FirestoreService();

  Future<void> initData() async {
    final stream = firestoreService.getStreamData();
    stream.listen((event) {
      myDataList.assignAll(event);
      update();
    });
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      results.clear();
    }

    searchText.value = query;

    if (searchText.value.length >= 1) {
      searchText.value = searchText.value
          .replaceRange(0, 1, searchText.value[0].toUpperCase());

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
  void onInit() async {
    await initData(); // BU BELKİ EN ALTA ALINABİLİR

    CollectionReference id = firestore
        .collection("allRegions")
        .doc(firebaseAuth.currentUser?.uid)
        .collection("regions");
    var allId = await id.get();
    var data2 = allId.docs;

    for (var i = 0; i < data2.length; i++) {
      var data = await fetchData(sensorID: data2[i]["sensorId"]);
      handleData(data);
      Map<String, dynamic> regions = {
        "plantType": data2[i]["plantType"],
        "plantVariet": data2[i]["plantVariet"].trim(),
        "plantingDate": data2[i]["plantingDate"],
        "regionName": data2[i]["regionName"],
        "sensorId": data2[i]["sensorId"],
        "minSic": minMaxDatas.isNotEmpty
            ? minMaxDatas["sicaklik"]["min"].toString()
            : "?",
        "maxSic": minMaxDatas.isNotEmpty
            ? minMaxDatas["sicaklik"]["max"].toString()
            : "?",
        "minNem":
            minMaxDatas.isNotEmpty ? minMaxDatas["nem"]["min"].toString() : "?",
        "maxNem":
            minMaxDatas.isNotEmpty ? minMaxDatas["nem"]["max"].toString() : "?",
      };
      CollectionReference addRegion = firestore
          .collection("allRegions")
          .doc(firebaseAuth.currentUser?.uid)
          .collection("regions");

      var response = await addRegion
          .doc(
              "${data2[i]["regionName"]} - ${data2[i]["plantVariet"].trim()}-${data2[i]["plantType"]}")
          .set(regions);
    }
    super.onInit();
  }

  Future<dynamic> fetchData({required String sensorID}) async {
    var url = Uri.https(
        "us-central1-doxif-2a9f5.cloudfunctions.net", "/get_snb_stats");
    var response =
        await http.post(url, body: {"sensorID": sensorID, "date": yesterday});
    var data = json.decode(response.body);
    return data;
  }

  void handleData(data) async {
    if (data == null) {
      print("data ve resp");
      return;
    }
    if (data["status"] == 200) {
      hoursData = data["data"]["daily"]["hoursByHours"];
      minMaxDatas = data["data"]["daily"]["data"];
      weeklyData = data["data"]["weekly"]["data"];
    } else {
      print("Veri yok");
    }
  }
}
