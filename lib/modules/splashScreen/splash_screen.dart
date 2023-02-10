import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorai/modules/splashScreen/splash.dart';
import 'package:tutorai/shared/constants/constants.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Center(
              child: Text("İlk Sayfa"),
            )
          ],
        ));
  }
}
