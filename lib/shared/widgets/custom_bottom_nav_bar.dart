import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tutorai/modules/addSensor/addSensor.dart';

import '../constants/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.controller,
  });

  dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColors.white,
        currentIndex: controller.currentBottomTab.value,
        onTap: (value) {
          controller.scanBtn.value = false;
          controller.currentBottomTab.value = value;
          print(controller.currentBottomTab.value);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/home.svg",
              color: controller.scanBtn.value == true
                  ? AppColors.inActiveIcColor
                  : controller.currentBottomTab.value == 0
                      ? AppColors.appColor
                      : AppColors.inActiveIcColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/menu.svg",
              color: controller.scanBtn.value == true
                  ? AppColors.inActiveIcColor
                  : controller.currentBottomTab.value == 1
                      ? AppColors.appColor
                      : AppColors.inActiveIcColor,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
