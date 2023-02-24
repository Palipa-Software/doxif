import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/homeDetailScreen/home_detail_screen.dart';
import 'package:tutorai/modules/homeScreen/home_screen_controller.dart';

import '../constants/colors.dart';

class PlantCard extends StatelessWidget {
  PlantCard({
    super.key,
    required this.imagePath,
    required this.temperatureValue,
    required this.highTemperatureValue,
    required this.highTemperatureValueClock,
    required this.lowTemperatureValue,
    required this.lowTemperatureValueClock,
    required this.humidityValue,
    required this.highHumidityValue,
    required this.highHumidityValueClock,
    required this.lowHumidityValue,
    required this.lowHumidityValueClock,
    required this.regionName,
    required this.plantName,
  });

  final String imagePath;
  final String regionName;
  final String plantName;
  final String temperatureValue;
  final String highTemperatureValue;
  final String highTemperatureValueClock;

  final String lowTemperatureValue;
  final String lowTemperatureValueClock;

  final String humidityValue;
  final String highHumidityValue;
  final String highHumidityValueClock;

  final String lowHumidityValue;
  final String lowHumidityValueClock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 2.5.w),
      child: Padding(
        padding: EdgeInsets.only(bottom: 18.56),
        child: Bounceable(
          onTap: () {
            Get.to(HomeDetailScreen(), arguments: [
              regionName,
              plantName,
              temperatureValue,
              humidityValue
            ]);
          },
          child: Stack(
            children: [
              Container(
                color: Color(0xffF8F8F8),
                height: 28.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 9.h,
                      color: Color(0xffF8F8F8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            regionName,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Rubik Bold",
                                color: Color(0xff292323),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            plantName,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Rubik Bold",
                                color: Color(0xff292323),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(3.sp)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 3.w, top: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/images/heatIco.png"),
                                        color: Color(0xffFFB838),
                                      ),
                                      // Container(
                                      //   height: 2.7.h,
                                      //   width: 5.w,
                                      //   decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //           image: AssetImage(
                                      //               "assets/images/heatIco.png"),
                                      //           fit: BoxFit.cover)),
                                      // ),
                                      SizedBox(
                                        width: 1.3.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.5.h),
                                        child: Text(
                                          "Sıcaklık",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Color(0xff292323),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Rubik Bold"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${temperatureValue}°C",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFB838),
                                        fontFamily: "Rubik Bold"),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.4.h),
                                              child: Text(
                                                "Dün \nEn Yüksek",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "${highTemperatureValue}°C",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffFFB838),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                highTemperatureValueClock,
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 6.5.h,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/solidIco.png"),
                                          color: Color(0xffE5E5E5),
                                        ),
                                      ),
                                      Container(
                                        color: AppColors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.4.h),
                                              child: Text(
                                                "Dün \nEn Düşük",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "${lowTemperatureValue}°C",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff878787),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                lowTemperatureValueClock,
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.w, top: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            "assets/images/waterIco.png"),
                                        color: Color(0xff459ED5),
                                      ),
                                      // Container(
                                      //   height: 2.7.h,
                                      //   width: 5.w,
                                      //   decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //           image: AssetImage(
                                      //               "assets/images/waterIco.png"),
                                      //           fit: BoxFit.cover)),
                                      // ),
                                      SizedBox(
                                        width: 1.3.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.5.h),
                                        child: Text(
                                          "Nem",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Color(0xff292323),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Rubik Bold"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${humidityValue}%",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff459ED5),
                                        fontFamily: "Rubik Bold"),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.4.h),
                                              child: Text(
                                                "Dün \nEn Yüksek",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "${highHumidityValue}%",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff459ED5),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                highHumidityValueClock,
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 6.5.h,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/solidIco.png"),
                                          color: Color(0xffE5E5E5),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.4.h),
                                              child: Text(
                                                "Dün \nEn Düşük",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "${lowHumidityValue}%",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff878787),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                lowHumidityValueClock,
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 4.h,
                child: Container(
                  height: 12.5.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/${imagePath}"))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
