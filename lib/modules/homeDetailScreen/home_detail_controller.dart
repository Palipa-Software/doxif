import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/shared/widgets/ideal.dart';
import 'package:seramcepte/shared/widgets/not_ideal.dart';

class HomeDetailController extends GetxController {
  var selectedItem = "Sıcaklık".obs;
  var selectedItem2 = "Şimdi".obs;
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

  var items = ["Sıcaklık", "Nem", "Işık", "Yaprak Sıcaklığı", "VPD Değerleri"].obs;
  var items2 = ["Şimdi", "7 günlük"].obs;
  var isOpen = true.obs;
  var isList = true.obs;

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
    var ferti = FirebaseFirestore.instance.collection("condition").doc("gubreleme");

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
    var spray = FirebaseFirestore.instance.collection("condition").doc("ilaclama");

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
  void onInit() {
    super.onInit();
    getPure();
    getFerti();
    getSpraying();
  }

  String getDay(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('gun').onValue.listen((event) async {
      day.value = event.snapshot.value.toString();
    });
    return day.value;
  }

  String getMounthId(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('ay').onValue.listen((event) async {
      mounthId.value = event.snapshot.value.toString();
    });
    return getMounth(mounthId.value);
  }

  String getYear(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('yil').onValue.listen((event) async {
      year.value = event.snapshot.value.toString();
    });
    return year.value;
  }

  String getTemp(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('sicaklik').onValue.listen((event) async {
      temparature.value = event.snapshot.value.toString();
    });
    return temparature.value;
  }

  String getHumidity(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('nem').onValue.listen((event) async {
      humidity.value = event.snapshot.value.toString();
    });
    return humidity.value;
  }

  String getLight(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('isik').onValue.listen((event) async {
      light.value = event.snapshot.value.toString();
    });
    return light.value;
  }

  String getSoilMoisture(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('toprakNem').onValue.listen((event) async {
      soilMoisture.value = event.snapshot.value.toString();
    });
    return soilMoisture.value;
  }

  String getVpd(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('vpd').onValue.listen((event) async {
      vpd.value = event.snapshot.value.toString();
    });
    return vpd.value;
  }

  String getDeltaT(String sensorId) {
    FirebaseDatabase.instance.ref("SNB/$sensorId").child('deltaT').onValue.listen((event) async {
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

  Widget fertilizationSuitabilities(String soilMoisture, String light, String vpd) {
    double soilMoistureValue = double.parse(soilMoisture);
    double lightValue = double.parse(light);
    double vpdValue = double.parse(vpd);

    if (soilMoistureValue > fertisoilmo[0] && soilMoistureValue < fertisoilmo[1]) {
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

  Widget sprayingSuitabilities(String temparature, String light, String deltaT) {
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
