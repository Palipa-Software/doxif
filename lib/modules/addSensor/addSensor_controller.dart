import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddSensorController extends GetxController {
  RxInt currentBottomTab = 0.obs;
  RxBool scanBtn = false.obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;

  void reassemble() {
    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
  }

  void a() {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            "#ff6666", "Cancel", false, ScanMode.DEFAULT)
        ?.listen((barcode) {});
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
}
