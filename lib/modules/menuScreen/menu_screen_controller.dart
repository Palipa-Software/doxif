import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seramcepte/modules/homeScreen/home_screen_controller.dart';

class MenuScreenController extends GetxController {
  RxInt currentBottomTab = 1.obs;
  RxBool scanBtn = false.obs;

  RxString userName = "".obs;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final user = FirebaseAuth.instance.currentUser!;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  Future<void> deleteUser() async {
    await user.delete();
  }

  Future<void> getSensorIds() async {
    var sensor = FirebaseFirestore.instance
        .collection("allRegions")
        .doc(user.uid)
        .collection("regions");
    var sensorId = await sensor.get();
    var regions = sensorId.docs;
    for (var element in regions) {
      Map<String, dynamic>? sensorsId = element.data();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSensorIds();
  }
}
