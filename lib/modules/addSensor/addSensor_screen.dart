import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/addSensor/addSensor_controller.dart';
import 'package:seramcepte/shared/constants/strings.dart';

import '../../routes/routes.dart';
import '../../shared/widgets/widgets.dart';

class AddSensor extends GetView<AddSensorController> {
  AddSensor({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddSensorController());
    controller.scanBtn.value = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.addSensorTitle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 100.w,
              child: Column(
                children: [
                  Obx(
                    () => controller.scannedId.value.isNotEmpty
                        ? Expanded(
                            child: Lottie.asset(
                              "assets/jsons/qr_done.json",
                              repeat: false,
                            ),
                          )
                        : controller.error.value.isEmpty
                            ? Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                  ),
                                  width: 100.w,
                                  child: QRView(
                                      key: controller.qrKey,
                                      onQRViewCreated: (controller) {
                                        this.controller.qrViewController =
                                            controller;
                                        controller.scannedDataStream.listen(
                                          (scanData) {
                                            this.controller.result = scanData;
                                            this.controller.scannedId.value =
                                                this.controller.result!.code!;
                                            this.controller.getAllSensorIds();

                                            print(this.controller.result?.code);
                                            print(this
                                                .controller
                                                .scannedId
                                                .value);
                                          },
                                        );
                                      }),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 9.3.w,
                                  ),
                                  child: AutoSizeText(
                                    controller.error.value,
                                    minFontSize: 12,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: "Rubik Bold",
                                    ),
                                  ),
                                ),
                              ),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 10.h,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Obx(
                          () {
                            return controller.error.value.isNotEmpty
                                ? SizedBox.shrink()
                                : controller.scannedId.value != ""
                                    ? CustomSensorCard(
                                        func: () async {
                                          controller.addSensor();
                                          Get.toNamed(
                                            Routes.ADDREGION,
                                          );
                                        },
                                        sensorName: controller.sensorName.value,
                                        sensorType: controller.sensorType.value,
                                      )
                                    : SizedBox(
                                        width: 95.w,
                                        child: Center(
                                          child: Text(
                                            controller.notFound.value,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: "Rubik Bold",
                                            ),
                                          ),
                                        ),
                                      );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
