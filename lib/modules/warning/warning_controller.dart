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
    var warnings = FirebaseFirestore.instance.collection("warnings");
    var warning = await warnings.get();
    var element = warning.docs;

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
      // realTimeDatas(databaseRef);
      if (temp.value.toString() == "nan") {
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
        print("Hata");
      } else if (double.tryParse(humidity.value.toString())!.toDouble() >
          double.tryParse(element[i]["val"])!) {
        print(humidity.value.toString());
        print(double.tryParse(element[i]["val"])!);
        warningList.add({
          "title": regions[i]["regionName"],
          "subtitle": element[i]["desc"],
          "ic_path": element[i]["icon"],
        });
        print("Yüksek Nem");
      } else if (double.tryParse(temp.value.toString())!.toDouble() >
          double.tryParse(element[i]["val"])!) {
        print(humidity.value.toString());

        print(double.tryParse(element[i]["val"])!);
        warningList.add({
          "title": regions[i]["regionName"],
          "subtitle": element[i]["desc"],
          "ic_path": element[i]["icon"],
        });

        print("Yüksek Sıcaklık");
      } else if (double.tryParse(humidity.value.toString())!.toDouble() <
          double.tryParse(element[i]["val"])!) {
        print(humidity.value.toString());

        print(double.tryParse(element[i]["val"])!);
        warningList.add({
          "title": regions[i]["regionName"],
          "subtitle": element[i]["desc"],
          "ic_path": element[i]["icon"],
        });

        print("Düşük nem");
      } else if (double.tryParse(temp.value.toString())!.toDouble() <
          double.tryParse(element[i]["val"])!) {
        print(humidity.value.toString());

        print(double.tryParse(element[i]["val"])!);
        warningList.add({
          "title": regions[i]["regionName"],
          "subtitle": element[i]["desc"],
          "ic_path": element[i]["icon"],
        });

        print("Düşük sıcaklık");
      }
    }
  }

  @override
  void onInit() {
    getSensorID();

    super.onInit();
  }

  RxList warningList = [].obs;
}
