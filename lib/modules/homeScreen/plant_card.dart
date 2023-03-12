import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:seramcepte/routes/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/homeDetailScreen/home_detail_screen.dart';

import '../../shared/constants/colors.dart';

class PlantCard extends StatelessWidget {
  PlantCard({
    super.key,
    required this.imagePath,
    required this.regionName,
    required this.plantName,
    required this.sensorId,
  });

  final String imagePath;
  final String regionName;
  final String plantName;
  final String sensorId;

  RxString tempature = "".obs;
  RxString humidity = "".obs;
  @override
  Widget build(BuildContext context) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('sicaklik')
        .onValue
        .listen((event) async {
      tempature.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('nem')
        .onValue
        .listen((event) async {
      humidity.value = event.snapshot.value.toString();
    });

    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 2.5.w),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.56),
        child: Bounceable(
          onTap: () {
            Get.toNamed(Routes.HOMEDETAIL, arguments: [
              regionName,
              plantName,
              sensorId,
            ]);
          },
          child: Stack(
            children: [
              Container(
                color: const Color(0xffF8F8F8),
                height: 24.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 5.h,
                      color: const Color(0xffF8F8F8),
                      child: Text(
                        regionName.replaceRange(
                            0, 1, regionName[0].toUpperCase()),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Rubik Bold",
                            color: const Color(0xff292323),
                            fontWeight: FontWeight.w700),
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
                                      const ImageIcon(
                                        AssetImage("assets/images/heatIco.png"),
                                        color: Color(0xffFFB838),
                                      ),
                                      SizedBox(
                                        width: 1.3.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.5.h),
                                        child: Text(
                                          "Sıcaklık",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: const Color(0xff292323),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Rubik Bold"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Text(
                                      "${tempature.value}°C",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffFFB838),
                                          fontFamily: "Rubik Bold"),
                                    ),
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
                                                    color:
                                                        const Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "°C",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xffFFB838),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.5.h,
                                        child: const ImageIcon(
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
                                                    color:
                                                        const Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "°C",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff878787),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xff6A6F7D),
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
                                      const ImageIcon(
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
                                              color: const Color(0xff292323),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Rubik Bold"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Text(
                                      "%${humidity.value}",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff459ED5),
                                          fontFamily: "Rubik Bold"),
                                    ),
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
                                                    color:
                                                        const Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff459ED5),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.5.h,
                                        child: const ImageIcon(
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
                                                    color:
                                                        const Color(0xff6A6F7D),
                                                    fontFamily: "Rubik Bold"),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff878787),
                                                  fontFamily: "Rubik Bold"),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: 5.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xff6A6F7D),
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
                child: Container(
                  height: 12.5.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/$imagePath"))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
