import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class CustomWarningCard extends StatelessWidget {
  int index;
  CustomWarningCard({
    super.key,
    required this.index,
    required this.controller,
  });

  dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: AppColors.coldMorning,
        ),
        borderRadius: BorderRadius.circular(
          12.sp,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10.5.w,
            height: 10.5.w,
            decoration: BoxDecoration(
              color: AppColors.appColor.withOpacity(
                .3,
              ),
              borderRadius: BorderRadius.circular(
                8.sp,
              ),
            ),
            child: Image.asset(
              "assets/images/${controller.warningList[index]["ic_path"]}.png",
              color: AppColors.appColor,
              scale: 20,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 1.5.h,
                bottom: 4.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.warningList[index]["title"],
                    style: TextStyle(
                      fontFamily: "Rubik Bold",
                      color: AppColors.warningCardTitle,
                    ),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Text(
                    controller.warningList[index]["subtitle"],
                    style: TextStyle(
                      fontFamily: "Rubik Regular",
                      color: AppColors.inActiveIcColor,
                      fontSize: 8.5.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
