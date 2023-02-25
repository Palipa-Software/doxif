import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSensorController extends GetxController {
  RxInt currentBottomTab = 0.obs;
  RxBool scanBtn = false.obs;
  RxString scannedId = "".obs;
  RxString notFound = "Sensörünüzdeki QR kodu okutunuz".obs;
  RxString sensorIdFirst = "".obs;
  String sensorIdFirst2 = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;
  RxString sensorName = "".obs;
  RxString sensorType = "".obs;

  void reassemble() {
    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  Future<String?> getSensorID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("sensorID");
    print("id:$id");
    return id;
  }

  void addSensor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('sensorID', result!.code.toString());
  }

  void getSensor() {
    switch (scannedId.value.split("")[0]) {
      case "":
        {
          print("Boş sensör");
          scannedId.value == "";
          print("1");
        }
        break;

      case "1":
        {
          sensorName.value = "Sera Ortam Sensörü";
          sensorType.value = "SNB";
          print("1 numaralı sensör");
          print("2");
        }
        break;

      default:
        {
          scannedId.value = "";
          notFound.value = "Lütfen geçerli bir kod okutunuz";
          print("Buramı acaba");
        }
        break;
    }
  }
}
