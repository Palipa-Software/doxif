import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddSensorController extends GetxController {
  RxInt currentBottomTab = 0.obs;
  RxBool scanBtn = false.obs;
  RxString scannedId = "".obs;
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

  void getSensor() {
    // sensorIdFirst = result!.code!.substring(0, 1); SENSÖR TESTİ İÇİN ASIL OLCAK OLAN YER
    sensorIdFirst2 = "1";
    sensorIdFirst.value = "1";
    switch (sensorIdFirst2) {
      case "":
        {
          print("Boş sensör");
          print("1");
        }
        break;

      case "1":
        {
          sensorName.value = "Sıcaklık Sensörü";
          sensorType.value = "LM35 Sensör";
          print("1 numaralı sensör");
          print("2");
        }
        break;

      case "2":
        {
          sensorName.value = "Nem Sensörü";
          sensorType.value = "LM36 Sensör";
          print("2 numaralı sensör");
          print("3");
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    print("Şuanda QR okutuluyor Varsayıyoruz...");
    Timer(Duration(seconds: 5), () {
      getSensor();
      print("QR OKUNDU");
    });
  }
}
