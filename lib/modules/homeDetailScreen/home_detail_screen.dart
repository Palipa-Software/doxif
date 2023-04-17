// ignore_for_file: unrelated_type_equality_checks, empty_catches

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:seramcepte/routes/routes.dart';
import 'package:seramcepte/shared/constants/constants.dart';
import 'package:seramcepte/shared/constants/fonsts.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:seramcepte/modules/homeScreen/home_screen_controller.dart';
import 'package:seramcepte/shared/constants/colors.dart';
import 'package:seramcepte/shared/widgets/cloudy.dart';
import 'package:seramcepte/shared/widgets/sunny_right.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../shared/widgets/day_info.dart';
import '../../shared/widgets/green_house_info.dart';
import '../../shared/widgets/grill.dart';
import '../../shared/widgets/ideal.dart';
import '../../shared/widgets/list_form.dart';
import '../../shared/widgets/not_ideal.dart';
import '../../shared/widgets/plant_grafic_row.dart';
import '../../shared/widgets/sunny.dart';
import '../../shared/widgets/sunny_center.dart';
import '../../shared/widgets/weather.dart';

class HomeDetailScreen extends GetView<HomeDetailController> {
  const HomeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeDetailController());
    var args = Get.arguments;
    // print("Bu sefer oldumu ki:${controller.weeklyAverages.length}");
    // var data = RxList<SalesData>([]);
    // data = salesDataLists(controller: controller);

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.HOME);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 25.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff49BC78),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.sp),
                          bottomRight: Radius.circular(20.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 6.5.h, left: 4.w, right: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Bounceable(
                              onTap: () {
                                Get.offAllNamed(Routes.HOME);
                              },
                              child: Container(
                                height: 5.h,
                                width: 11.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xff6cc691),
                                    borderRadius: BorderRadius.circular(17.sp)),
                                child: Center(
                                  child: ImageIcon(
                                    const AssetImage(
                                        "assets/images/shapeback.png"),
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            Bounceable(
                              onTap: () {},
                              child: Container(
                                height: 5.h,
                                width: 11.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xff6cc691),
                                    borderRadius: BorderRadius.circular(17.sp)),
                                child: Center(
                                  child: ImageIcon(
                                    const AssetImage(
                                        "assets/images/morehorizontal.png"),
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: -5.w,
                    top: -2.h,
                    child: ImageIcon(
                      const AssetImage("assets/images/ellipse4.png"),
                      size: 150.sp,
                    )),
                Positioned(
                    right: -5.w,
                    top: -2.h,
                    child: ImageIcon(
                      const AssetImage("assets/images/ellipse5.png"),
                      size: 110.sp,
                    )),
                Positioned(
                  right: -5.w,
                  top: -2.h,
                  child: ImageIcon(
                    const AssetImage(
                      "assets/images/ellipse6.png",
                    ),
                    size: 70.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        args[0].toString(),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Rubik Bold",
                            color: AppColors.white),
                      ),
                      AutoSizeText(
                        "${args[1]} Serası",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Rubik Bold",
                            color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sera Bilgileri",
                    style: TextStyle(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Rubik Bold",
                        color: const Color(0xff41443C)),
                  ),
                  Obx(() {
                    return Bounceable(
                      onTap: () {
                        if (controller.isList.value == true) {
                          controller.isList.value = false;
                        } else {
                          controller.isList.value = true;
                        }
                      },
                      child: Container(
                        width: 27.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5.sp),
                            border: Border.all(
                                color: const Color(0xffD1D4D6), width: 0.5.w)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageIcon(
                                controller.isList.value == true
                                    ? const AssetImage("assets/images/list.png")
                                    : const AssetImage(
                                        "assets/images/grill.png"),
                                color: const Color(0xff49BC78),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                controller.isList.value == true
                                    ? "Liste"
                                    : "Izgara",
                                style: TextStyle(
                                    fontSize: 12.33.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Rubik Regular",
                                    color: const Color(0xff3C3C47)),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(child: Obx(() {
              return ListView(
                children: [
                  controller.isList.value == true
                      ? ListForm(
                          args: args,
                        )
                      : Grill(args: args),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                    child: Row(
                      children: [
                        Text(
                          "Grafikler",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Rubik Bold",
                              color: const Color(0xff41443C)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Obx(() {
                          return Container(
                            padding: EdgeInsets.only(left: 3.5.w),
                            width: 27.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                border: Border.all(
                                    color: const Color(0xffD1D4D6),
                                    width: 0.5.w)),
                            child: DropdownButton(
                              isExpanded: true,
                              value: controller.selectedItem.value,
                              underline: const SizedBox.shrink(),
                              items: controller.items
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: AutoSizeText(
                                    value,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Rubik Regular",
                                        color: const Color(0xff3C3C47)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) async {
                                controller.onItemSelected(newValue!);
                                controller.chartsType = newValue;
                                controller.getFieldName();
                                // data.clear();
                                // data = salesDataLists(controller: controller);
                                print(controller.chartsTypeFieldName);
                                weeklyAverages.clear();
                                if (controller.selectedItem2.value ==
                                        "Günlük" &&
                                    salesDataLists.isNotEmpty) {
                                  salesDataLists.clear();
                                  controller.addSalesDataLists();
                                  print(
                                      "Listeye noldu:${salesDataLists.first.datas}");
                                } else if (controller.selectedItem2.value ==
                                    "Haftalık") {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appColor,
                                        ),
                                      );
                                    },
                                  );
                                  try {
                                    await controller.getWeekDays(
                                        length: 8, list: weeklyAverages);
                                    salesDataLists.clear();

                                    salesDataLists.addAll(weeklyAverages);
                                    Get.back();
                                  } catch (e) {}
                                } else if (controller.selectedItem2.value ==
                                    "15 Günlük") {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appColor,
                                        ),
                                      );
                                    },
                                  );
                                  try {
                                    await controller.getWeekDays(
                                        length: 16, list: for15DaysAverages);
                                    salesDataLists.clear();
                                    salesDataLists.addAll(for15DaysAverages);
                                    Get.back();
                                  } catch (e) {}
                                } else if (controller.selectedItem2.value ==
                                    "Aylık") {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appColor,
                                        ),
                                      );
                                    },
                                  );
                                  try {
                                    await controller.getWeekDays(
                                        length: 31, list: monthlyAverages);
                                    salesDataLists.clear();
                                    salesDataLists.addAll(monthlyAverages);
                                    Get.back();
                                  } catch (e) {}
                                } else {
                                  Get.snackbar("Title", "Message",
                                      backgroundColor:
                                          AppColors.appColor.withOpacity(.8),
                                      titleText: AutoSizeText(
                                        "Bilgilendirme",
                                        style: TextStyle(
                                          fontFamily: "Rubik Bold",
                                          color: AppColors.white,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      messageText: Text(
                                        "${controller.selectedItem2.value} Veriler Toplanmadı",
                                        style: TextStyle(
                                          fontFamily: "Rubik Regular",
                                          color: AppColors.white,
                                          fontSize: 10.sp,
                                        ),
                                      ));
                                  controller.onItemSelected2("Günlük");
                                }
                              },
                            ),
                          );
                        }),
                        SizedBox(
                          width: 6.w,
                        ),
                        Obx(() {
                          return Container(
                            padding: EdgeInsets.only(left: 3.5.w),
                            width: 27.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                border: Border.all(
                                    color: const Color(0xffD1D4D6),
                                    width: 0.5.w)),
                            child: DropdownButton(
                              isExpanded: true,
                              value: controller.selectedItem2.value,
                              underline: const SizedBox.shrink(),
                              items: controller.items2
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: AutoSizeText(
                                    value,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Rubik Regular",
                                        color: const Color(0xff3C3C47)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) async {
                                controller.onItemSelected2(newValue!);

                                if (controller.selectedItem2.value ==
                                        "Günlük" &&
                                    salesDataLists.isNotEmpty) {
                                  salesDataLists.clear();
                                  controller.addSalesDataLists();
                                } else if (controller.selectedItem2.value ==
                                    "Haftalık") {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appColor,
                                        ),
                                      );
                                    },
                                  );
                                  try {
                                    await controller.getWeekDays(
                                        length: 8, list: weeklyAverages);
                                    salesDataLists.clear();

                                    salesDataLists.addAll(weeklyAverages);
                                    Get.back();
                                  } catch (e) {}
                                } else if (controller.selectedItem2.value ==
                                    "15 Günlük") {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appColor,
                                        ),
                                      );
                                    },
                                  );
                                  try {
                                    await controller.getWeekDays(
                                        length: 16, list: for15DaysAverages);
                                    salesDataLists.clear();
                                    salesDataLists.addAll(for15DaysAverages);
                                    Get.back();
                                  } catch (e) {}
                                } else if (controller.selectedItem2.value ==
                                    "Aylık") {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appColor,
                                        ),
                                      );
                                    },
                                  );
                                  try {
                                    await controller.getWeekDays(
                                        length: 31, list: monthlyAverages);
                                    salesDataLists.clear();
                                    salesDataLists.addAll(monthlyAverages);
                                    Get.back();
                                  } catch (e) {}
                                } else {
                                  Get.snackbar("Title", "Message",
                                      backgroundColor:
                                          AppColors.appColor.withOpacity(.8),
                                      titleText: AutoSizeText(
                                        "Bilgilendirme",
                                        style: TextStyle(
                                          fontFamily: "Rubik Bold",
                                          color: AppColors.white,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      messageText: Text(
                                        "${controller.selectedItem2.value} Veriler Toplanmadı",
                                        style: TextStyle(
                                          fontFamily: "Rubik Regular",
                                          color: AppColors.white,
                                          fontSize: 10.sp,
                                        ),
                                      ));
                                  controller.onItemSelected2("Günlük");
                                }
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 1.h,
                    ),
                    child: Center(
                      child: salesDataLists.isEmpty
                          ? Text(
                              "Herhangi bir veri kaydedilmemiştir",
                              style: TextStyle(
                                color: AppColors.addPhoto,
                                fontFamily: AppFonts.regular,
                                fontSize: 12.sp,
                              ),
                            )
                          : Obx(() {
                              return SfCartesianChart(
                                // enableAxisAnimation: true,
                                primaryXAxis: CategoryAxis(
                                    labelRotation: -45,
                                    autoScrollingMode: AutoScrollingMode.end,
                                    labelPlacement: LabelPlacement.onTicks,
                                    maximumLabels: 24,
                                    labelStyle: AppTextStyle.chartText
                                    // title: AxisTitle(
                                    //     text: "Saat",
                                    //     textStyle: TextStyle(
                                    //       color: AppColors.addPhoto,
                                    //       fontSize: 9.sp,
                                    //       fontFamily: AppFonts.regular,
                                    //     ),
                                    //     alignment: ChartAlignment.center),
                                    ),
                                // Chart title
                                title: ChartTitle(
                                    text: "${controller.chartsType} Grafiği"),
                                series: <LineSeries<SalesData, String>>[
                                  LineSeries<SalesData, String>(
                                    dataSource: salesDataLists.toList(),
                                    markerSettings: MarkerSettings(
                                      color: AppColors.white,
                                      height: .5.h,
                                      width: .5.h,
                                      borderColor: AppColors.addPhoto,
                                      borderWidth: .3.w,
                                      isVisible: true,
                                    ),
                                    onPointTap: (pointInteractionDetails) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => Get.back(),
                                            child: Scaffold(
                                              backgroundColor:
                                                  Colors.transparent,
                                              body: Center(
                                                child: Container(
                                                  width: 24.w,
                                                  height: 6.h,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: controller.lineColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8.sp,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Spacer(),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Zaman: ${salesDataLists[pointInteractionDetails.pointIndex!].time}",
                                                          style: AppTextStyle
                                                              .chartDialogText,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Değer: ${double.parse(
                                                            salesDataLists[
                                                                    pointInteractionDetails
                                                                        .pointIndex!]
                                                                .datas
                                                                .toStringAsFixed(
                                                                    2),
                                                          ).toString()}",
                                                          style: AppTextStyle
                                                              .chartDialogText,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      print(pointInteractionDetails.pointIndex);
                                    },
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.time,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.datas,
                                    color: controller.lineColor,
                                    // Enable data label
                                    dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        angle: -45,
                                        builder: (datas, point, series,
                                            pointIndex, seriesIndex) {
                                          return Text(
                                            double.parse(
                                              salesDataLists[pointIndex]
                                                  .datas
                                                  .toStringAsFixed(2),
                                            ).toString(),
                                            style: TextStyle(
                                              color: AppColors.addPhoto,
                                              fontSize: 7.sp,
                                            ),
                                          );
                                        },
                                        textStyle: TextStyle(
                                          color: AppColors.addPhoto,
                                        )),
                                  ),
                                ],
                              );
                            }),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Obx(() {
                    return controller.isOpen.value == true
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              height: 57.h,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5.sp),
                                  border: Border.all(
                                      color: const Color(0xffD1D4D6),
                                      width: 0.5.w)),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 3.h, left: 8.w),
                                        child: Container(
                                          height: 11.h,
                                          width: 24.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/sun2.png"),
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sera Sıcaklığı",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xff41443C),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Rubik Regular"),
                                            ),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            Text(
                                              "Mevsim normallerinde",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "Rubik Regular",
                                                  color:
                                                      const Color(0xff9E9E9D)),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "${controller.getTemp(args[2])} °C",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Rubik Regular",
                                                  color:
                                                      const Color(0xffFFB838)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.h),
                                        child: Bounceable(
                                          onTap: () {
                                            controller.isOpen.value = false;
                                          },
                                          child: const ImageIcon(
                                            AssetImage(
                                                "assets/images/Vector.png"),
                                            color: Color(0xff49BC78),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  const PlantGraficRow(
                                    imagePath: "tomato.png",
                                    plantName: "Domates",
                                    ideality: IdealTempreture(),
                                  ),
                                  const PlantGraficRow(
                                    imagePath: "biber6.png",
                                    plantName: "Biber",
                                    ideality: SoHot(),
                                  ),
                                  const PlantGraficRow(
                                    imagePath: "patlıcan.png",
                                    plantName: "Patlıcan",
                                    ideality: VeryCold(),
                                  ),
                                  const PlantGraficRow(
                                    imagePath: "hıyar.png",
                                    plantName: "Hıyar",
                                    ideality: IdealTempreture(),
                                  ),
                                  const PlantGraficRow(
                                    imagePath: "kabak.png",
                                    plantName: "Kabak",
                                    ideality: IdealTempreture(),
                                  ),
                                  const PlantGraficRow(
                                    imagePath: "kavun.png",
                                    plantName: "Kavun",
                                    ideality: VeryCold(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Bounceable(
                                onTap: () {
                                  controller.isOpen.value = true;
                                },
                                child: const ImageIcon(
                                  AssetImage("assets/images/lowerIco.png"),
                                  color: Color(0xff49BC78),
                                ),
                              ),
                            ),
                          );
                  }),
                  SizedBox(
                    height: 4.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.5.w),
                    child: Text(
                      "Gün Bilgileri",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Rubik Bold",
                          color: const Color(0xff41443C)),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Container(
                      height: 57.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6.sp),
                        border: Border.all(
                            color: const Color(0xffD1D4D6), width: 0.5.w),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 7.w, top: 3.5.h, right: 7.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        return Text(
                                          "${controller.getDay(args[2])} ${controller.getMounthId(args[2])} ${controller.getYear(args[2])}",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Rubik Regular",
                                              color: const Color(0xff41443C)),
                                        );
                                      }),
                                      SizedBox(
                                        height: 0.3.h,
                                      ),
                                      Text(
                                        "${controller.getTemp(args[2])} °C",
                                        style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Rubik Bold",
                                            color: const Color(0xffFFB838)),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Container(
                                        height: 4.h,
                                        width: 27.w,
                                        decoration: BoxDecoration(
                                            color: const Color(0xfffff1d7),
                                            borderRadius:
                                                BorderRadius.circular(17.sp)),
                                        child: Center(
                                          child: Text(
                                            "Güneşli",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Rubik Bold",
                                                color: const Color(0xffFFB838)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 14.h,
                                    width: 32.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Ellipse2933.png"))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Text(
                                "Bugün",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Rubik Regular",
                                    color: const Color(0xff9E9E9D)),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Weather(
                                    clock: "12:00",
                                    value: "19",
                                    child: SunnyRight(),
                                  ),
                                  Weather(
                                    clock: "13:00",
                                    value: "20",
                                    child: Sunny(),
                                  ),
                                  Weather(
                                    clock: "14:00",
                                    value: "21",
                                    child: Cloudy(),
                                  ),
                                  Weather(
                                    clock: "15:00",
                                    value: "24",
                                    child: Cloudy(),
                                  ),
                                  Weather(
                                    clock: "16:00",
                                    value: "19",
                                    child: SunnyCenter(),
                                  ),
                                  Weather(
                                    clock: "17:00",
                                    value: "17",
                                    child: Sunny(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              const DayInfo(
                                icoPath: "sunrise.png",
                                title: "Gün Doğumu",
                                value: "07:23",
                              ),
                              const DayInfo(
                                icoPath: "sunset.png",
                                title: "Gün Batımı",
                                value: "19:52",
                              ),
                              const DayInfo(
                                icoPath: "sun2.png",
                                title: "Gün Uzunluğu",
                                value: "9 saat 13 dk",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.5.w),
                    child: Text(
                      "Diğer Sera Bilgileri",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Rubik Bold",
                          color: const Color(0xff41443C)),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        GreenhouseInfo(
                          color: Color(0xffeff0e3),
                          icoPath: "scissors.png",
                          title: "Budama",
                          humidity: controller.getHumidity(args[2]),
                          light: controller.getLight(args[2]),
                          temparature: controller.getTemp(args[2]),
                          soilMoisture: controller.getSoilMoisture(args[2]),
                          vpd: controller.getTemp(args[2]),
                          deltaT: controller.getDeltaT(args[2]),
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        GreenhouseInfo(
                          color: Color(0xffe1d9d2),
                          icoPath: "OBJECTS.png",
                          title: "İlaçlama",
                          humidity: controller.getHumidity(args[2]),
                          light: controller.getLight(args[2]),
                          temparature: controller.getTemp(args[2]),
                          soilMoisture: controller.getSoilMoisture(args[2]),
                          vpd: controller.getTemp(args[2]),
                          deltaT: controller.getDeltaT(args[2]),
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        GreenhouseInfo(
                          color: Color(0xffdaecf7),
                          icoPath: "fertilization.png",
                          title: "Gübreleme",
                          humidity: controller.getHumidity(args[2]),
                          light: controller.getLight(args[2]),
                          temparature: controller.getTemp(args[2]),
                          soilMoisture: controller.getSoilMoisture(args[2]),
                          vpd: controller.getTemp(args[2]),
                          deltaT: controller.getDeltaT(args[2]),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }))
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.time, this.datas);
  final String time;
  final double datas;
}

RxList<SalesData> salesDataListMonthly({dynamic controller}) {
  return [
    SalesData('Aylık 1.Gün', double.parse(controller.weeklyAverages[0])),
    SalesData('Aylık 2.Gün', double.parse(controller.weeklyAverages[1])),
    SalesData('Aylık 3.Gün', double.parse(controller.weeklyAverages[2])),
    // SalesData('3.Gün', double.parse(controller.weeklyAverages[2])),
    // BİR HAFTALIK VERİ OLUŞANA KADAR BÖYLE KALACAK
    // SalesData('4.Gün', double.parse(controller.weeklyAverages[3])),
    // SalesData('5.Gün', double.parse(controller.weeklyAverages[4])),
    // SalesData('6.Gün', double.parse(controller.weeklyAverages[5])),
    // SalesData('7.Gün', double.parse(controller.weeklyAverages[6])),
  ].obs;
}

// 15 Günlük Grafik
RxList<SalesData> salesDataListFor15Days({dynamic controller}) {
  return [
    SalesData('15 Günlük 1.Gün', double.parse(controller.weeklyAverages[0])),
    SalesData('15 Günlük 2.Gün', double.parse(controller.weeklyAverages[1])),
    SalesData('15 Günlük 3.Gün', double.parse(controller.weeklyAverages[2])),
    // SalesData('3.Gün', double.parse(controller.weeklyAverages[2])),
    // BİR HAFTALIK VERİ OLUŞANA KADAR BÖYLE KALACAK
    // SalesData('4.Gün', double.parse(controller.weeklyAverages[3])),
    // SalesData('5.Gün', double.parse(controller.weeklyAverages[4])),
    // SalesData('6.Gün', double.parse(controller.weeklyAverages[5])),
    // SalesData('7.Gün', double.parse(controller.weeklyAverages[6])),
  ].obs;
}
// Haftalık Grafik

// RxList<SalesData> salesDataListWeekly({dynamic controller}) {
//   return [
//     SalesData('Haftalık 1.Gün', double.parse(controller.weeklyAverages[0])),
//     SalesData('Haftalık 2.Gün', double.parse(controller.weeklyAverages[1])),
//     SalesData('Haftalık 3.Gün', double.parse(controller.weeklyAverages[2])),
//     // SalesData('4.Gün', double.parse(controller.weeklyAverages[3])),
//     // BİR HAFTALIK VERİ OLUŞANA KADAR BÖYLE KALACAK
//     // SalesData('4.Gün', double.parse(controller.weeklyAverages[3])),
//     // SalesData('5.Gün', double.parse(controller.weeklyAverages[4])),
//     // SalesData('6.Gün', double.parse(controller.weeklyAverages[5])),
//     // SalesData('7.Gün', double.parse(controller.weeklyAverages[6])),
//   ].obs;
// }

// Günlük Grafik
RxList<SalesData> salesDataLists = <SalesData>[].obs;
RxList<SalesData> weeklyAverages = <SalesData>[].obs;
RxList<SalesData> for15DaysAverages = <SalesData>[].obs;
RxList<SalesData> monthlyAverages = <SalesData>[].obs;
// () {
//   print("Bu ne olaki:${args[3].values}");
  // 07:00-08:00 ARASI SENSÖRDEKİ VERİLER KAYDEDİLMEMİŞ
  // return [
    // SalesData(
    //   '00:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(0)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '01:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(1)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '02:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(2)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '03:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(3)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '04:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(4)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '05:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(5)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '06:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(6)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '07:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(7)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '08:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(8)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '09:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(9)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '10:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(10)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '11:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(11)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '12:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(12)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '13:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(13)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '14:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(14)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '15:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(15)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '16:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(16)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '17:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(17)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '18:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(18)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '19:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(19)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '20:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(20)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '21:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(21)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '22:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(22)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
    // SalesData(
    //   '23:00',
    //   double.parse(
    //     args[3]
    //         .values
    //         .elementAt(23)[controller.chartsTypeFieldName]["average"]
    //         .toStringAsFixed(1),
    //   ),
    // ),
  // ].obs;
// }
