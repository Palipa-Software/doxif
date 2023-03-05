// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/homeScreen/home_screen_controller.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/constants/strings.dart';

class WarningController extends GetxController {
  final HomeScreenController homeScreenController = HomeScreenController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> getSensorID() async {
    var tempWarnings = FirebaseFirestore.instance.collection("tempWarnings");
    var tempWarning = await tempWarnings.get();
    var tempWarningElement = tempWarning.docs;
    var humidityWarnings =
        FirebaseFirestore.instance.collection("humidityWarnings");
    var humidityWarning = await humidityWarnings.get();
    var humidityWarningElement = humidityWarning.docs;

    var sensor = FirebaseFirestore.instance
        .collection("allRegions")
        .doc(auth.currentUser!.uid)
        .collection("regions");
    var sensorId = await sensor.get();
    var regions = sensorId.docs;

    for (var i = 0; i < regions.length; i++) {
      final databaseRef = FirebaseDatabase.instance
          .ref("SNB")
          .child("${regions[i]["sensorId"]}");

      var temp = await databaseRef.child("sicaklik").get();
      var humidity = await databaseRef.child("nem").get();
      for (var index = 0; index < humidityWarningElement.length; index++) {
        if (temp.value == null || humidity.value == null) {
          Get.snackbar("Title", "Message",
              backgroundColor: AppColors.appColor.withOpacity(.8),
              titleText: AutoSizeText(
                regions[i]["regionName"] + " " + "serası",
                style: TextStyle(
                  fontFamily: "Rubik Bold",
                  color: AppColors.white,
                  fontSize: 13.sp,
                ),
              ),
              messageText: Text(
                AppStrings.defectiveSensor,
                style: TextStyle(
                  fontFamily: "Rubik Regular",
                  color: AppColors.white,
                  fontSize: 10.sp,
                ),
              ));
          break;
        } else if (double.tryParse(humidity.value.toString())!.toDouble() >
            double.tryParse(humidityWarningElement[0]["val"])!) {
          print(humidity.value.toString());
          print(double.tryParse(humidityWarningElement[0]["val"])!);
          warningList.add({
            "title": regions[i]["regionName"],
            "subtitle": humidityWarningElement[0]["desc"],
            "ic_path": humidityWarningElement[0]["icon"],
          });
          print("Yüksek Nem");
          break;
        } else if (double.tryParse(humidity.value.toString())!.toDouble() <
            double.tryParse(humidityWarningElement[1]["val"])!) {
          print(humidity.value.toString());

          print(double.tryParse(humidityWarningElement[1]["val"])!);
          warningList.add({
            "title": regions[i]["regionName"],
            "subtitle": humidityWarningElement[1]["desc"],
            "ic_path": humidityWarningElement[1]["icon"],
          });

          print("Düşük nem");
          break;
        }
      }
      for (var tempIndex = 0;
          tempIndex < tempWarningElement.length;
          tempIndex++) {
        if (temp.value == null || humidity.value == null) {
          break;
        } else if (double.tryParse(temp.value.toString())!.toDouble() >
            double.tryParse(tempWarningElement[0]["val"])!) {
          print(temp.value.toString());

          print(double.tryParse(tempWarningElement[tempIndex]["val"])!);
          warningList.add({
            "title": regions[i]["regionName"],
            "subtitle": tempWarningElement[0]["desc"],
            "ic_path": tempWarningElement[0]["icon"],
          });

          print("Yüksek Sıcaklık");
          break;
        } else if (double.tryParse(temp.value.toString())!.toDouble() <
            double.tryParse(tempWarningElement[1]["val"])!) {
          print(temp.value.toString());

          print(double.tryParse(tempWarningElement[1]["val"])!);
          warningList.add({
            "title": regions[i]["regionName"],
            "subtitle": tempWarningElement[1]["desc"],
            "ic_path": tempWarningElement[1]["icon"],
          });

          print("Düşük sıcaklık");
          break;
        }
      }

      // realTimeDatas(databaseRef);
    }
  }

  @override
  void onInit() {
    getSensorID();

    super.onInit();
  }

  RxList warningList = [].obs;
}
