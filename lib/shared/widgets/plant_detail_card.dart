import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class PlantDetailCard extends StatelessWidget {
  const PlantDetailCard({
    super.key,
    required this.icoBackgroundColor,
    required this.icoPath,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.valueType,
    required this.icoColor,
    required this.valueColor,
  });
  final Color icoBackgroundColor;
  final String icoPath;
  final Color icoColor;
  final String title;
  final String subTitle;
  final String value;
  final String valueType;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        height: 11.h,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(12.sp)),
        child: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: Container(
                      height: 8.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                          color: icoBackgroundColor,
                          borderRadius: BorderRadius.circular(7.sp)),
                      child: Center(
                          child: ImageIcon(
                        AssetImage("assets/images/${icoPath}"),
                        color: icoColor,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      width: 38.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Rubik Bold",
                                color: AppColors.black),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            subTitle,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Rubik Regular",
                                color: Color(0xff9E9E9D)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  if (valueType == "°C")
                    Text(
                      "${value} ${valueType}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik Bold",
                          color: valueColor),
                    )
                  else if (valueType == "%")
                    Text(
                      "${valueType} ${value}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik Bold",
                          color: valueColor),
                    )
                  else
                    Text(
                      "${value}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik Bold",
                          color: valueColor),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
