import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:tutorai/shared/widgets/grill_card.dart';

class Grill extends GetView<HomeDetailController> {
  const Grill({
    super.key,
    required this.args,
  });
  final dynamic args;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.5.w,
        right: 4.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GrillCard(
                icoPath: "sun2.png",
                icoColor: Color(0xffFFB838),
                value: "${args[2]}°C",
                valueColor: Color(0xffFFB838),
              ),
              GrillCard(
                icoColor: Color(0xff459ED5),
                icoPath: "droplet.png",
                value: "%${args[3]}",
                valueColor: Color(0xff459ED5),
              ),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xff50862B),
                  icoPath: "leaf.png",
                  value: "${controller.leafTemp.value}°C",
                  valueColor: Color(0xff50862B),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xffE28B3A),
                  icoPath: "ic_outline-light.png",
                  value: "%${controller.light.value}",
                  valueColor: Color(0xffE28B3A),
                );
              }),
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xff69431F),
                  icoPath: "iconoir_watering-soil.png",
                  value: "%${controller.soilMoisture.value}",
                  valueColor: Color(0xff69431F),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xffEA4335),
                  icoPath: "carbon_soil-temperature.png",
                  value: "${controller.soilTemp.value}°C",
                  valueColor: Color(0xffEA4335),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xff2DDA93),
                  icoPath: "iconoir_soil-alt.png",
                  value: "%${controller.dewPoint.value}",
                  valueColor: Color(0xff2DDA93),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoPath: "iconoir_sea-waves.png",
                  icoColor: Color(0xff000000),
                  value: controller.vpd.value,
                  valueColor: Color(0xffE28B3A),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
