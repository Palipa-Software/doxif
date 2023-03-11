import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/routes/app_pages.dart';

import '../../modules/addSensor/addSensor.dart';
import '../constants/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({
    super.key,
    required this.controller,
    required this.func,
  });

  dynamic controller;
  void Function() func;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            func();
            // Get.toNamed(Routes.ADDSENSOR);
            // controller.scanBtn.value = true;
            // print(controller.scanBtn.value);
          },
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(
            "assets/images/scan.svg",
            color: AppColors.inActiveIcColor,
          ),
        ),
      ),
    );
  }
}
