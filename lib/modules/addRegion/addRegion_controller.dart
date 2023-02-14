import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/constants/custom_firebase_manager.dart';
import 'package:tutorai/shared/constants/strings.dart';
import 'package:tutorai/shared/widgets/custom_add_region_button.dart';

class AddRegionController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController regionName = TextEditingController();
  RxString selectedDate = "".obs;
  RxInt index = 0.obs;
  RxInt index2 = 0.obs;
  RxList variets = [].obs;
  String variet = "";
  String type = "";
  String plantImage = "";
  RxString plantImagePath = "".obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference plantsVarients =
      FirebaseFirestore.instance.collection("plantsType");

  final Stream<QuerySnapshot<Object?>>? stream =
      CustomFirebaseManager.stream("plantsType");

  Future<dynamic> addRegion() async {
    Map<String, dynamic> regions = {
      "regionName": regionName.text,
      "plantType": type,
      "plantVariet": variet,
      "plantingDate": selectedDate.value,
      "sensorId": "222222",
    };
    CollectionReference addRegion = firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection("regions");

    var response = await addRegion.doc(regionName.text).set(regions);
    successDialog();
    return response;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImage();
  }

  void getImage() {
    plantImage = type.toLowerCase();
    switch (plantImage) {
      case "":
        {
          // plantImage = "";
          print("plantimage:$plantImage");
          print("1");
        }
        break;

      case "domates":
        {
          // plantImage = "domates";
          plantImagePath.value = "domates";
          print("plantimage:$plantImage");
          print("2");
        }
        break;

      case "biber":
        {
          // plantImage = "biber";
          plantImagePath.value = "biber";
          print("plantimage:$plantImage");
          print("3");
        }
        break;
      case "patlıcan":
        {
          // plantImage = "patlıcan";
          plantImagePath.value = "patlıcan";
          print("plantimage:$plantImage");
          print("4");
        }
        break;
      case "kabak":
        {
          // plantImage = "kabak";
          plantImagePath.value = "kabak";
          print("plantimage:$plantImage");
          print("5");
        }
        break;
      case "kavun":
        {
          // plantImage = "kavun";
          plantImagePath.value = "kavun";
          print("plantimage:$plantImage");
          print("6");
        }
        break;
      case "hıyar":
        {
          // plantImage = "hıyar";
          plantImagePath.value = "hıyar";
          print("plantimage:$plantImage");
          print("7");
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void successDialog() {
    if (regionName.text.isNotEmpty &&
        selectedDate.isNotEmpty &&
        variet.isNotEmpty &&
        type.isNotEmpty) {
      Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: EdgeInsets.zero,
        title: "",
        middleText: "",
        content: Column(
          children: [
            Container(
              width: 100.w,
              height: 15.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/success-dialog-icon.png",
                  ),
                  filterQuality: FilterQuality.high,
                ),
                color: AppColors.appColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(
                  16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              AppStrings.successDialogTitle,
              style: TextStyle(
                fontFamily: "Rubik Bold",
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.successDialogSubtitle,
              style: TextStyle(
                fontFamily: "Rubik Regular",
                // fontWeight: FontWeight.w100,
                fontSize: 11.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomButton(
                func: () {
                  regionName.clear();
                  selectedDate.value = "";
                  Get.back();
                },
                title: "Tamam",
                controller: this,
              ),
            )
          ],
        ),
      );
    } else {
      Get.snackbar("Title", "Message",
          backgroundColor: AppColors.appColor.withOpacity(.8),
          titleText: Text(
            AppStrings.errorTitle,
            style: TextStyle(
              fontFamily: "Rubik Bold",
              fontSize: 12.sp,
              color: AppColors.white,
            ),
          ),
          messageText: Text(
            AppStrings.errorSubtitle,
            style: TextStyle(
              fontSize: 10.sp,
              fontFamily: "Rubik Regular",
              color: AppColors.white,
            ),
          ));
    }
  }
}
