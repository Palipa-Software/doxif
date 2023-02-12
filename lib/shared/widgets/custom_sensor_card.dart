import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../routes/routes.dart';
import '../constants/constants.dart';

class CustomSensorCard extends StatelessWidget {
  String sensorType;
  String sensorName;
  CustomSensorCard({
    super.key,
    required this.sensorName,
    required this.sensorType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          7.sp,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            7.sp,
          ),
          color: AppColors.white,
        ),
        width: 95.w,
        height: 9.6.h,
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                sensorName,
                style: TextStyle(fontFamily: "Rubik Regular"),
              ),
              Text(
                sensorType,
                style: TextStyle(fontFamily: "Rubik Bold"),
              ),
            ],
          ),
          trailing: SizedBox(
            height: 100.h,
            child: Bounceable(
              onTap: () {
                Get.toNamed(Routes.ADDREGION);
              },
              child: Container(
                width: 9.5.w,
                height: 9.5.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.appColor,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          leading: Image.asset("assets/images/s-1.png"),
        ),
      ),
    );
  }
}
