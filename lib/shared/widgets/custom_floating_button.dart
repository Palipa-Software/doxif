import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/routes/app_pages.dart';

import '../../modules/addSensor/addSensor.dart';
import '../constants/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({
    super.key,
    required this.controller,
  });

  dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(
            2.sp,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.bgColor,
          ),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Get.toNamed(Routes.ADDSENSOR);
              controller.scanBtn.value = true;
              print(controller.scanBtn.value);
            },
            child: SvgPicture.asset(
              "assets/images/scan.svg",
              color: controller.scanBtn.value == true
                  ? AppColors.appColor
                  : AppColors.inActiveIcColor,
            ),
            backgroundColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
