import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:seramcepte/shared/widgets/grill_card.dart';

class Grill extends GetView<HomeDetailController> {
  Grill({
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
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('sicaklik').onValue.listen((event) async {
      tempature.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('nem').onValue.listen((event) async {
      humidity.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('yapSic').onValue.listen((event) async {
      leaf.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('isik').onValue.listen((event) async {
      light.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('toprakNem').onValue.listen((event) async {
      soilMoisture.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('toprakSic').onValue.listen((event) async {
      soilTemp.value = event.snapshot.value.toString();
    });

    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('cigNoktasi').onValue.listen((event) async {
      dewPoint.value = event.snapshot.value.toString();
    });
    FirebaseDatabase.instance.ref("SNB/${args[2].toString()}").child('vpd').onValue.listen((event) async {
      vpd.value = event.snapshot.value.toString();
    });
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
              Obx(() {
                return GrillCard(
                  icoPath: "sun2.png",
                  icoColor: Color(0xffFFB838),
                  value: "${tempature.value}°C",
                  valueColor: Color(0xffFFB838),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xff459ED5),
                  icoPath: "droplet.png",
                  value: "%${humidity.value}",
                  valueColor: Color(0xff459ED5),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xff50862B),
                  icoPath: "leaf.png",
                  value: "${leaf.value}°C",
                  valueColor: Color(0xff50862B),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xffE28B3A),
                  icoPath: "ic_outline-light.png",
                  value: "%${light.value}",
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
                  value: "%${soilMoisture.value}",
                  valueColor: Color(0xff69431F),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xffEA4335),
                  icoPath: "carbon_soil-temperature.png",
                  value: "${soilTemp.value}°C",
                  valueColor: Color(0xffEA4335),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoColor: Color(0xff2DDA93),
                  icoPath: "iconoir_soil-alt.png",
                  value: "%${dewPoint.value}",
                  valueColor: Color(0xff2DDA93),
                );
              }),
              Obx(() {
                return GrillCard(
                  icoPath: "iconoir_sea-waves.png",
                  icoColor: Color(0xff000000),
                  value: vpd.value,
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
