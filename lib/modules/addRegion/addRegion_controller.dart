// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/addSensor/addSensor.dart';
import 'package:seramcepte/modules/homeScreen/home_screen_controller.dart';
import 'package:seramcepte/routes/app_pages.dart';
import 'package:seramcepte/shared/constants/colors.dart';
import 'package:seramcepte/shared/constants/custom_firebase_manager.dart';
import 'package:seramcepte/shared/constants/strings.dart';
import 'package:seramcepte/shared/widgets/custom_add_region_button.dart';

class AddRegionController extends GetxController {
  final AddSensorController addSensorController = AddSensorController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController regionName = TextEditingController();
  RxString variet = "".obs;

  RxString selectedDate = "".obs;
  RxInt index = 0.obs;
  RxList variets = [].obs;
  List<dynamic> searchVariets = [];
  String type = "Biber";
  String plantImage = "";
  RxString plantImagePath = "".obs;

  HomeScreenController homeScreenController = HomeScreenController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference plantsVarients =
      FirebaseFirestore.instance.collection("plantsType");

  final Stream<QuerySnapshot<Object?>>? stream =
      CustomFirebaseManager.stream("plantsType");

  Future<String?> getSensorID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("sensorID");
    return id;
  }

  Future<dynamic> addRegion() async {
    var id = await getSensorID();
    Map<String, dynamic> regions = {
      "regionName": regionName.text.substring(0, 1).toUpperCase() +
          regionName.text.substring(1),
      "plantType": type,
      "plantVariet": variet.value,
      "plantingDate": selectedDate.value,
      "sensorId": id,
    };
    CollectionReference addRegion = firestore
        .collection("allRegions")
        .doc(_auth.currentUser?.uid)
        .collection("regions");

    var response = await addRegion
        .doc("${regionName.text} - ${variet.value}-$type")
        .set(regions);
    return response;
  }

  @override
  void onInit() {
    super.onInit();
    getImage();
  }

  void getImage() {
    plantImage = type.toLowerCase();
    switch (plantImage) {
      case "":
        {
          print("plantimage:$plantImage");
          print("1");
        }
        break;

      case "domates":
        {
          plantImagePath.value = "domates";
          print("plantimage:$plantImage");
          print("2");
        }
        break;

      case "biber":
        {
          plantImagePath.value = "biber";
          print("plantimage:$plantImage");
          print("3");
        }
        break;
      case "patlıcan":
        {
          plantImagePath.value = "patlıcan";
          print("plantimage:$plantImage");
          print("4");
        }
        break;
      case "kabak":
        {
          plantImagePath.value = "kabak";
          print("plantimage:$plantImage");
          print("5");
        }
        break;
      case "kavun":
        {
          plantImagePath.value = "kavun";
          print("plantimage:$plantImage");
          print("6");
        }
        break;
      case "hıyar":
        {
          plantImagePath.value = "hıyar";
          print("plantimage:$plantImage");
          print("7");
        }
        break;

      default:
        {}
        break;
    }
  }

  Future<void> handleAddRegion() async {
    var id = await getSensorID();
    if (id == null) {
      Get.back();
      Get.snackbar(
        "Title",
        "Message",
        backgroundColor: AppColors.red.withOpacity(.8),
        titleText: Text(
          AppStrings.errorTitle,
          style: TextStyle(
            fontFamily: "Rubik Bold",
            fontSize: 12.sp,
            color: AppColors.white,
          ),
        ),
        messageText: Text(
          AppStrings.notFoundSensor,
          style: TextStyle(
            fontSize: 10.sp,
            fontFamily: "Rubik Regular",
            color: AppColors.white,
          ),
        ),
      );
    } else if (regionName.text.isNotEmpty &&
        selectedDate.isNotEmpty &&
        variet.value.isNotEmpty &&
        type.isNotEmpty) {
      await addRegion();
      await getSensorID();
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
                func: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("sensorID");
                  regionName.clear();
                  selectedDate.value = "";
                  Get.offAllNamed(Routes.MAINPAGE);
                },
                title: "Tamam",
                controller: this,
              ),
            )
          ],
        ),
      );
    } else {
      Get.back();

      Get.snackbar(
        "Title",
        "Message",
        backgroundColor: AppColors.red.withOpacity(.8),
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
        ),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();

    print("Ben çalıştım");
  }
}
