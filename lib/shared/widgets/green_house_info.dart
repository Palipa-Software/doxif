import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class GreenhouseInfo extends StatelessWidget {
  const GreenhouseInfo({
    super.key,
    required this.color,
    required this.icoPath,
    required this.title,
    required this.isIdeal,
  });
  final Color color;
  final String icoPath;
  final String title;
  final Widget isIdeal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 21.5.h,
          width: 28.5.w,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(7.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.5.h),
                child: Container(
                  height: 8.h,
                  width: 18.w,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(7.sp)),
                  child: Center(
                      child: ImageIcon(AssetImage("assets/images/${icoPath}"))),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Rubik Bold",
                    color: Color(0xff41443C)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              isIdeal
            ],
          ),
        ),
        Container(
          height: 2.h,
        )
      ],
    );
  }
}
