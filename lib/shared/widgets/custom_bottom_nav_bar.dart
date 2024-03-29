import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:seramcepte/modules/homeScreen/home_screen.dart';
import 'package:seramcepte/modules/menuScreen/menu_screen.dart';

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
          controller.currentBottomTab.value = value;
          controller.scanBtn.value = false;
          print(controller.currentBottomTab.value);

          value == 0
              ? Get.to(() => const HomeScreen())
              : Get.to(() => const MenuScreen());
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
