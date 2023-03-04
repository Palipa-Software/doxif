import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:tutorai/modules/homeScreen/home_screen_controller.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/widgets/cloudy.dart';
import 'package:tutorai/shared/widgets/sunny_right.dart';

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
    // Sıcaklık verileri
    final List<double> temperatures = [
      15.0,
      16.0,
      17.0,
      18.0,
      19.0,
      20.0,
      21.0,
      100,
      -10
    ];

    // Saat verileri
    final List<String> hours = [
      "00",
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23"
    ];

    HomeScreenController homeScreenController = HomeScreenController();

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff49BC78),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(47.sp),
                        bottomRight: Radius.circular(47.sp))),
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
                              Get.back();
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
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            args[0].toString(),
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Rubik Bold",
                                color: AppColors.white),
                          ),
                          AutoSizeText(
                            "${args[1]} Serası",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Rubik Bold",
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  child: ImageIcon(
                    const AssetImage("assets/images/ellipse4.png"),
                    size: 200.sp,
                  )),
              Positioned(
                  right: 0,
                  top: 0.5.h,
                  child: ImageIcon(
                    const AssetImage("assets/images/ellipse5.png"),
                    size: 175.sp,
                  )),
              Positioned(
                right: 6.w,
                top: 4.h,
                child: ImageIcon(
                  const AssetImage(
                    "assets/images/ellipse6.png",
                  ),
                  size: 123.sp,
                ),
              )
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
                                  : const AssetImage("assets/images/grill.png"),
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
                            items: controller.items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Rubik Regular",
                                      color: const Color(0xff3C3C47)),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.onItemSelected(newValue!);
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
                            items: controller.items2
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Rubik Regular",
                                      color: const Color(0xff3C3C47)),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.onItemSelected2(newValue!);
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Center(
                      child: Container(
                        width: 200.w,
                        height: 30.h,
                        child: LineChart(
                          LineChartData(
                            minY: temperatures.reduce((value, element) =>
                                    value < element ? value : element) -
                                0.0,
                            maxY: temperatures.reduce((value, element) =>
                                    value > element ? value : element) +
                                2.0,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, temperatures[8]),
                                  FlSpot(1, temperatures[8]),
                                  FlSpot(2, temperatures[3]),
                                  FlSpot(3, temperatures[4]),
                                  FlSpot(4, temperatures[7]),
                                  FlSpot(5, temperatures[5]),
                                  FlSpot(6, temperatures[6]),
                                  FlSpot(7, temperatures[7]),
                                  FlSpot(8, temperatures[1]),
                                  FlSpot(9, temperatures[7]),
                                  FlSpot(10, temperatures[7]),
                                  FlSpot(11, temperatures[4]),
                                  FlSpot(12, temperatures[7]),
                                  FlSpot(13, temperatures[7]),
                                  FlSpot(14, temperatures[5]),
                                  FlSpot(15, temperatures[7]),
                                  FlSpot(16, temperatures[8]),
                                  FlSpot(17, temperatures[7]),
                                  FlSpot(18, temperatures[3]),
                                  FlSpot(19, temperatures[7]),
                                  FlSpot(20, temperatures[5]),
                                  FlSpot(21, temperatures[3]),
                                  FlSpot(22, temperatures[2]),
                                  FlSpot(23, temperatures[5]),
                                ],
                                isCurved: true,
                                color: Color(0xfffff1d7),
                                barWidth: 1.w,
                                isStrokeCapRound: true,
                                dotData: FlDotData(
                                  show: true,
                                ),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Color(0xffFFB838),
                                ),
                              )
                            ],
                            titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return SideTitleWidget(
                                        axisSide: meta.axisSide,
                                        space: 6.sp,
                                        angle: 0.0,
                                        child: Text(
                                          "${hours[value.toInt()]}:00",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    getTitlesWidget: (value, meta) {
                                      return SideTitleWidget(
                                        axisSide: meta.axisSide,
                                        space: 5.sp,
                                        angle: 0.0,
                                        child: Text(
                                          "${value.toInt()}°C",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false))),
                          ),
                        ),
                      ),
                    ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 3.h, left: 8.w),
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
                                                color: const Color(0xff41443C),
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
                                                color: const Color(0xff9E9E9D)),
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
                                                color: const Color(0xffFFB838)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
