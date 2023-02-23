import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class GrillCard extends StatelessWidget {
  const GrillCard({
    super.key,
    required this.icoPath,
    required this.value,
    required this.icoColor,
    required this.valueColor,
  });
  final String icoPath;
  final String value;
  final Color icoColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          width: 22.w,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(17.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 8.w, left: 8.w),
                child: ImageIcon(
                  AssetImage("assets/images/${icoPath}"),
                  color: icoColor,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Rubik Bold",
                    color: valueColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
