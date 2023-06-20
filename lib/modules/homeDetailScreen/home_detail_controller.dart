import 'dart:convert';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:seramcepte/shared/constants/colors.dart';
import 'package:seramcepte/shared/widgets/ideal.dart';
import 'package:http/http.dart' as http;
import 'package:seramcepte/shared/widgets/not_ideal.dart';
import 'package:sizer/sizer.dart';

import 'home_detail_screen.dart';

var args = Get.arguments;

class HomeDetailController extends GetxController {
  RxString chartDay = "".obs;
  var selectedItem = "Sıcaklık".obs;
  String chartsType = "Sıcaklık";
  RxString chartsTypeFieldName = "".obs;
  Color lineColor = AppColors.softBoiled;
  Map<String, dynamic> minMaxDatasWeekly = {};

  var selectedItem2 = "Günlük".obs;
  List<String> temperatures = [];
  RxString day = "".obs;
  RxString year = "".obs;
  RxString mounth = "".obs;
  RxString mounthId = "".obs;
  RxString temparature = "".obs;
  RxString humidity = "".obs;
  RxString vpd = "".obs;
  RxString light = "".obs;
  RxString soilMoisture = "".obs;
  RxString deltaT = "".obs;
  Widget? suitibality;
  Widget? fertilizationSuitability;
  Widget? sprayingSuitability;
  var fertiVpd;
  var spraytemp;
  var spraylight;
  List purelights = [];
  List puretemp = [];
  List purehumi = [];
  List fertilights = [];
  List fertisoilmo = [];
  List spreydelta = [];
  var data = List.generate(7, (index) => Random().nextInt(100)).obs;

  var firebaseAuth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref("SNB/1222104");

  var items = [
    "Sıcaklık",
    "Nem",
    "Yaprak Sıcaklığı",
    "Toprak Nemi",
    "Toprak Sıcaklığı",
    "Çiğ Noktası"
  ].obs;
  var items2 = ["Günlük", "Haftalık", "15 Günlük", "Aylık"].obs;
  var isOpen = true.obs;
  var isList = true.obs;

  void getFieldName() {
    switch (chartsType) {
      case "Sıcaklık":
        chartsTypeFieldName.value = "sicaklik";
        lineColor = AppColors.softBoiled;
        print("Sıcaklık Grafiği");
        break;
      case "Nem":
        chartsTypeFieldName.value = "nem";
        lineColor = AppColors.peacefulRiver;
        print("Nem Grafiği");
        break;
      case "Yaprak Sıcaklığı":
        chartsTypeFieldName.value = "yapSic";
        lineColor = AppColors.freshOnion;
        print("Yaprak Sıcaklığı Grafiği");
        break;
      case "Toprak Nemi":
        chartsTypeFieldName.value = "toprakNem";
        lineColor = AppColors.emperador;
        print("Toprak Nemi Grafiği");
        break;
      case "Toprak Sıcaklığı":
        chartsTypeFieldName.value = "toprakSic";
        lineColor = AppColors.alizarin;
        print("Topark Sıcaklığı Grafiği");
        break;
      case "Çiğ Noktası":
        chartsTypeFieldName.value = "cigNoktasi";
        lineColor = AppColors.mintJelly;
        print("Çiğ Noktası Grafiği");
        break;
      default:
    }
  }

  void onItemSelected(String newValue) {
    selectedItem(newValue);
  }

  void onItemSelected2(String newValue) {
    selectedItem2(newValue);
  }

  Future<void> getPure() async {
    var pure = FirebaseFirestore.instance.collection("condition").doc("budama");

    var pures = await pure.get();
    for (var i = 1; i < 5; i++) {
      purelights.add(double.parse(pures["lightVal$i"]));
    }
    for (var i = 1; i < 3; i++) {
      puretemp.add(double.parse(pures["temperatureVal$i"]));
    }
    for (var i = 1; i < 6; i++) {
      purehumi.add(double.parse(pures["humidityVal$i"]));
    }
  }

  Future<void> getFerti() async {
    var ferti =
        FirebaseFirestore.instance.collection("condition").doc("gubreleme");

    var ferties = await ferti.get();
    for (var i = 1; i < 3; i++) {
      fertilights.add(double.parse(ferties["lightVal$i"]));
    }

    for (var i = 1; i < 3; i++) {
      fertisoilmo.add(double.parse(ferties["toprakNem$i"]));
    }
    fertiVpd = double.parse(ferties["vpd"]);
  }

  Future<void> getSpraying() async {
    var spray =
        FirebaseFirestore.instance.collection("condition").doc("ilaclama");

    var sprays = await spray.get();
    for (var i = 1; i < 5; i++) {
      spreydelta.add(double.parse(sprays["deltaValue$i"]));
    }
    spraylight = double.parse(sprays["light"]);
    spraytemp = double.parse(sprays["temperature"]);
  }

  String getMounth(String mounthValue) {
    switch (mounthValue) {
      case "1":
        mounth.value = "Ocak";

        break;
      case "2":
        mounth.value = "Şubat";
        break;
      case "3":
        mounth.value = "Mart";
        break;
      case "4":
        mounth.value = "Nisan";
        break;
      case "5":
        mounth.value = "Mayıs";
        break;
      case "6":
        mounth.value = "Haziran";
        break;
      case "7":
        mounth.value = "Temmuz";
        break;
      case "8":
        mounth.value = "Ağustos";
        break;
      case "9":
        mounth.value = "Eylül";
        break;
      case "10":
        mounth.value = "Ekim";
        break;
      case "11":
        mounth.value = "Kasım";
        break;
      case "12":
        mounth.value = "Aralık";
        break;

      default:
    }
    return mounth.value;
  }

  @override
  void onClose() {
    super.onClose();
    salesDataLists.clear();
  }

  @override
  void onInit() async {
    super.onInit();
    getPure();
    getFerti();
    getSpraying();
    getFieldName();
    await addSalesDataLists();
  }

  Future<void> addSalesDataLists() async {
    for (var i = 0; i < args[3].values.length; i++) {
      salesDataLists.add(SalesData(
          args[3].keys.elementAt(i).toString().split("-")[0].toString(),
          double.parse(
            args[3]
                .values
                .elementAt(i)[chartsTypeFieldName]["average"]
                .toStringAsFixed(1),
          ),
          chartDay.value));
    }
  }

  Future<void> getWeekDays(
      {required RxList<SalesData> list, required int length}) async {
    weeklyAverages.clear();
    for15DaysAverages.clear();
    monthlyAverages.clear();
    for (var i = 1; i < length; i++) {
      chartDay.value = DateFormat("yyyy-MM-dd").format(
        DateTime.now().subtract(
          Duration(
            days: i,
          ),
        ),
      );
      if (i < length) {
        var data =
            await fetchDataWeekly(sensorID: args[2], date: chartDay.value);
        handleDataWeekly(data, i, list);
      }

      print(chartDay.value);
      print("Veri Sayısı:$i");
    }
  }

  Future<dynamic> fetchDataWeekly(
      {required String sensorID, required String date}) async {
    var url = Uri.https(
        "us-central1-doxif-2a9f5.cloudfunctions.net", "/get_snb_stats");
    var response =
        await http.post(url, body: {"sensorID": sensorID, "date": date});
    var data = json.decode(response.body);
    return data;
  }

  void handleDataWeekly(data, index, RxList<SalesData> list) async {
    if (data == null) {
      print("data ve resp");
      return;
    }
    if (data["status"] == 200 && data["data"]["daily"]["data"].isNotEmpty) {
      list.add(SalesData(
          "$index.Gün",
          double.parse(
            data["data"]["daily"]["data"][chartsTypeFieldName.value]["average"]
                .toStringAsFixed(1),
          ),
          chartDay.value));
    } else {
      print("Veri yok");
    }
  }

  String getDay(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('gun')
        .onValue
        .listen((event) async {
      day.value = event.snapshot.value.toString();
    });
    return day.value;
  }

  String getMounthId(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('ay')
        .onValue
        .listen((event) async {
      mounthId.value = event.snapshot.value.toString();
    });
    return getMounth(mounthId.value);
  }

  String getYear(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('yil')
        .onValue
        .listen((event) async {
      year.value = event.snapshot.value.toString();
    });
    return year.value;
  }

  String getTemp(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('sicaklik')
        .onValue
        .listen((event) async {
      temparature.value = event.snapshot.value.toString();
    });
    return temparature.value;
  }

  String getHumidity(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('nem')
        .onValue
        .listen((event) async {
      humidity.value = event.snapshot.value.toString();
    });
    return humidity.value;
  }

  String getLight(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('isik')
        .onValue
        .listen((event) async {
      light.value = event.snapshot.value.toString();
    });
    return light.value;
  }

  String getSoilMoisture(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('toprakNem')
        .onValue
        .listen((event) async {
      soilMoisture.value = event.snapshot.value.toString();
    });
    return soilMoisture.value;
  }

  String getVpd(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('vpd')
        .onValue
        .listen((event) async {
      vpd.value = event.snapshot.value.toString();
    });
    return vpd.value;
  }

  String getDeltaT(String sensorId) {
    FirebaseDatabase.instance
        .ref("SNB/$sensorId")
        .child('deltaT')
        .onValue
        .listen((event) async {
      deltaT.value = event.snapshot.value.toString();
    });
    return deltaT.value;
  }

  Widget pruningSuitability(String temparature, String light, String humidity) {
    double temparatureValue = double.parse(temparature);
    double lightValue = double.parse(light);
    double humidityValue = double.parse(humidity);
    if (lightValue < purelights[0] || lightValue > purelights[1]) {
      suitibality = NotIdeal(text: "Yapmayınız");
    } else if (lightValue > purelights[0] && lightValue < purelights[2]) {
      suitibality = NotIdeal(text: "Riskli");
    } else if (lightValue > purelights[3] && lightValue < purelights[1]) {
      suitibality = NotIdeal(text: "Riskli");
    } else if (lightValue > purelights[2] && lightValue < purelights[3]) {
      if (temparatureValue > puretemp[0] && temparatureValue < puretemp[1]) {
        suitibality = NotIdeal(text: "Uygun Değil");
      } else if (temparatureValue > puretemp[1]) {
        suitibality = NotIdeal(text: "Yapmayınız");
      } else {
        if (humidityValue > purehumi[0] && humidityValue < purehumi[1]) {
          suitibality = Ideal(text: "İdeal");
        } else if (humidityValue > purehumi[2] && humidityValue < purehumi[3]) {
          suitibality = NotIdeal(text: "Uygun Değil");
        } else if (humidityValue < purehumi[2] || humidityValue > purehumi[4]) {
          suitibality = NotIdeal(text: "Yapmayınız");
        }
      }
    }
    return suitibality!;
  }

  Widget fertilizationSuitabilities(
      String soilMoisture, String light, String vpd) {
    double soilMoistureValue = double.parse(soilMoisture);
    double lightValue = double.parse(light);
    double vpdValue = double.parse(vpd);

    if (soilMoistureValue > fertisoilmo[0] &&
        soilMoistureValue < fertisoilmo[1]) {
      fertilizationSuitability = NotIdeal(text: "Riskli");
    } else if (soilMoistureValue > fertisoilmo[1]) {
      fertilizationSuitability = NotIdeal(text: "Yapmayınız");
    } else if (soilMoistureValue < fertisoilmo[0]) {
      if (lightValue < fertilights[0] || lightValue > fertilights[1]) {
        fertilizationSuitability = NotIdeal(text: "Yapmayınız");
      } else {
        if (vpdValue > fertiVpd) {
          fertilizationSuitability = NotIdeal(text: "Yapmayınız");
        } else {
          fertilizationSuitability = Ideal(text: "Uygun");
        }
      }
    }
    return fertilizationSuitability!;
  }

  Widget sprayingSuitabilities(
      String temparature, String light, String deltaT) {
    double temparatureValue = double.parse(temparature);
    double lightValue = double.parse(light);
    double deltaTValue = double.parse(deltaT);
    if (temparatureValue > spraytemp || lightValue < spraylight) {
      sprayingSuitability = NotIdeal(text: "Yapmayınız");
    } else if (temparatureValue < spraytemp && deltaTValue > spreydelta[0]) {
      sprayingSuitability = NotIdeal(text: "Yapmayınız");
    } else if (temparatureValue < spraytemp && deltaTValue < 1) {
      sprayingSuitability = NotIdeal(text: "Yapmayınız");
    } else if (deltaTValue > spreydelta[1] && deltaTValue < spreydelta[2]) {
      sprayingSuitability = NotIdeal(text: "Riskli");
    } else if (deltaTValue > spreydelta[3] && deltaTValue < spreydelta[0]) {
      sprayingSuitability = NotIdeal(text: "Riskli");
    } else if (deltaTValue > spreydelta[2] && deltaTValue < spreydelta[3]) {
      sprayingSuitability = Ideal(text: "Uygun");
    }
    return sprayingSuitability!;
  }
}
