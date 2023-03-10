import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/homeDetailScreen/home_detail_controller.dart';

import '../constants/colors.dart';

class GreenhouseInfo extends StatelessWidget {
  GreenhouseInfo({
    super.key,
    required this.color,
    required this.icoPath,
    required this.title,
    required this.light,
    required this.temparature,
    required this.humidity,
    required this.soilMoisture,
    required this.vpd,
    required this.deltaT,
  });
  final Color color;
  final String icoPath;
  final String title;
  final String light;
  final String temparature;
  final String humidity;
  final String soilMoisture;
  final String vpd;
  final String deltaT;

  @override
  Widget build(BuildContext context) {
    HomeDetailController controller = Get.put(HomeDetailController());

    switch (title) {
      case "Budama":
        {
          return puruningHouseInfo(controller);
        }
      case "Gübreleme":
        {
          return fertilizationHouseInfo(controller);
        }
      case "İlaçlama":
        {
          return sprayingHouseInfo(controller);
        }
      default:
        {
          return Container();
        }
    }
  }

  Widget puruningHouseInfo(HomeDetailController controller) {
    return Column(
      children: [
        Container(
          height: 21.5.h,
          width: 28.5.w,
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(7.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.5.h),
                child: Container(
                  height: 8.h,
                  width: 18.w,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(7.sp)),
                  child: Center(child: ImageIcon(AssetImage("assets/images/${icoPath}"))),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.sp, fontWeight: FontWeight.w500, fontFamily: "Rubik Bold", color: Color(0xff41443C)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              controller.pruningSuitability(temparature, light, humidity)
            ],
          ),
        ),
        Container(
          height: 2.h,
        )
      ],
    );
  }

  Widget fertilizationHouseInfo(HomeDetailController controller) {
    return Column(
      children: [
        Container(
          height: 21.5.h,
          width: 28.5.w,
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(7.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.5.h),
                child: Container(
                  height: 8.h,
                  width: 18.w,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(7.sp)),
                  child: Center(child: ImageIcon(AssetImage("assets/images/${icoPath}"))),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.sp, fontWeight: FontWeight.w500, fontFamily: "Rubik Bold", color: Color(0xff41443C)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              controller.fertilizationSuitabilities(soilMoisture, light, vpd)
            ],
          ),
        ),
        Container(
          height: 2.h,
        )
      ],
    );
  }

  Widget sprayingHouseInfo(HomeDetailController controller) {
    return Column(
      children: [
        Container(
          height: 21.5.h,
          width: 28.5.w,
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(7.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.5.h),
                child: Container(
                  height: 8.h,
                  width: 18.w,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(7.sp)),
                  child: Center(child: ImageIcon(AssetImage("assets/images/${icoPath}"))),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.sp, fontWeight: FontWeight.w500, fontFamily: "Rubik Bold", color: Color(0xff41443C)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              controller.sprayingSuitabilities(temparature, light, deltaT)
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
