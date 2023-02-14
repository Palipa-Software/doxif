import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  Function func;
  String title;
  CustomButton({
    super.key,
    required this.func,
    required this.title,
    required this.controller,
  });

  dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        func();
      },
      child: Container(
        width: 100.w,
        height: 6.5.h,
        decoration: BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.circular(
            14.sp,
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Rubik Regular",
              fontSize: 11.sp,
            ),
          ),
        ),
      ),
    );
  }
}
