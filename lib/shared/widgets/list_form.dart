import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:tutorai/shared/widgets/plant_detail_card.dart';

class ListForm extends GetView<HomeDetailController> {
  ListForm({
    super.key,
    required this.args,
  });
  final dynamic args;
  RxString tempature = "".obs;
  RxString humidity = "".obs;
  RxString leaf = "".obs;
  RxString light = "".obs;
  RxString soilMoisture = "".obs;
  RxString soilTemp = "".obs;
  RxString dewPoint = "".obs;
  RxString vpd = "".obs;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeDetailController());
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('sicaklik')
        .onValue
        .listen((event) async {
      tempature.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('nem')
        .onValue
        .listen((event) async {
      humidity.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('yapSic')
        .onValue
        .listen((event) async {
      leaf.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('isik')
        .onValue
        .listen((event) async {
      light.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('toprakNem')
        .onValue
        .listen((event) async {
      soilMoisture.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('toprakSic')
        .onValue
        .listen((event) async {
      soilTemp.value = event.snapshot.value.toString();
    });

    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('cigNoktasi')
        .onValue
        .listen((event) async {
      dewPoint.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance
        .ref("SNB/${args[2].toString()}")
        .child('vpd')
        .onValue
        .listen((event) async {
      vpd.value = event.snapshot.value.toString();
    });

    return Container(
      child: Column(
        children: [
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xfffff1d7),
              icoColor: Color(0xffFFB838),
              icoPath: "sun2.png",
              title: "Sıcaklık",
              subTitle: "Mevsim normallerinde",
              value: tempature.value,
              valueType: "°C",
              valueColor: Color(0xffFFB838),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xffdaecf7),
              icoColor: Color(0xff459ED5),
              icoPath: "droplet.png",
              title: "Nem",
              subTitle: "Mevsim normallerinde",
              value: humidity.value,
              valueType: "%",
              valueColor: Color(0xff459ED5),
            );
          }),
          SizedBox(
            height: 1.5.h,
          ),
          Obx(() {
            return PlantDetailCard(
              icoBackgroundColor: Color(0xffdce7d5),
              icoColor: Color(0xff50862B),
              icoPath: "leaf.png",
              title: "Yaprak Sıcaklığı",
              subTitle: "Mevsim normallerinde",
              value: leaf.value,
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
              value: light.value,
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
              value: soilMoisture.value,
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
              value: soilTemp.value,
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
              value: dewPoint.value,
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
              value: vpd.value,
              valueType: "",
              valueColor: Color(0xffE28B3A),
            );
          }),
        ],
      ),
    );
  }
}
