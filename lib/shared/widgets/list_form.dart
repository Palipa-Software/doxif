import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:tutorai/shared/widgets/plant_detail_card.dart';

class ListForm extends GetView<HomeDetailController> {
  const ListForm({
    super.key,
    required this.args,
  });
  final dynamic args;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeDetailController());
    return Container(
      child: Column(
        children: [
          PlantDetailCard(
            icoBackgroundColor: Color(0xfffff1d7),
            icoColor: Color(0xffFFB838),
            icoPath: "sun2.png",
            title: "Sıcaklık",
            subTitle: "Mevsim normallerinde",
            value: "${args[2]}",
            valueType: "°C",
            valueColor: Color(0xffFFB838),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          PlantDetailCard(
            icoBackgroundColor: Color(0xffdaecf7),
            icoColor: Color(0xff459ED5),
            icoPath: "droplet.png",
            title: "Nem",
            subTitle: "Mevsim normallerinde",
            value: "${args[3]}",
            valueType: "%",
            valueColor: Color(0xff459ED5),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xffdce7d5),
              icoColor: Color(0xff50862B),
              icoPath: "leaf.png",
              title: "Yaprak Sıcaklığ",
              subTitle: "Mevsim normallerinde",
              value: controller.leafTemp.value,
              valueType: "°C",
              valueColor: Color(0xff50862B),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xfff9e8d8),
              icoColor: Color(0xffE28B3A),
              icoPath: "ic_outline-light.png",
              title: "Işık",
              subTitle: "Sunlike",
              value: controller.light.value,
              valueType: "%",
              valueColor: Color(0xffE28B3A),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xffe1d9d2),
              icoColor: Color(0xff69431F),
              icoPath: "iconoir_watering-soil.png",
              title: "Toprak Nemi",
              subTitle: "Normal",
              value: controller.soilMoisture.value,
              valueType: "%",
              valueColor: Color(0xff69431F),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xfffbd9d7),
              icoColor: Color(0xffEA4335),
              icoPath: "carbon_soil-temperature.png",
              title: "Toprak Sıcaklığı",
              subTitle: "Normal",
              value: controller.soilTemp.value,
              valueType: "°C",
              valueColor: Color(0xffEA4335),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xffd5f8e9),
              icoColor: Color(0xff2DDA93),
              icoPath: "iconoir_soil-alt.png",
              title: "Çiğ Noktası",
              subTitle: "Normal",
              value: controller.dewPoint.value,
              valueType: "%",
              valueColor: Color(0xff2DDA93),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xfff9e8d8),
              icoColor: Color(0xff000000),
              icoPath: "iconoir_sea-waves.png",
              title: "VPD Değeri",
              subTitle: "Normal",
              value: controller.vpd.value,
              valueType: "",
              valueColor: Color(0xffE28B3A),
            );
          }),
        ],
      ),
    );
  }
}
