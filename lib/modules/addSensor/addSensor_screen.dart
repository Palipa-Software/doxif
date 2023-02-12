import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/addSensor/addSensor_controller.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutorai/shared/constants/strings.dart';

import '../../shared/widgets/widgets.dart';

class AddSensor extends GetView<AddSensorController> {
  const AddSensor({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      width: 100.w,
                      child: QRView(
                          key: controller.qrKey,
                          onQRViewCreated: (controller) {
                            this.controller.qrViewController = controller;
                            controller.scannedDataStream.listen((scanData) {
                              this.controller.result = scanData;
                              print(scanData);
                            });
                          }),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 10.h,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return CustomSensorCard(
                          sensorName: "Sıcaklık Sensörü",
                          sensorType: "LM35 Sensör",
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
      bottomNavigationBar: CustomBottomNavigationBar(
        controller: controller,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(
        controller: controller,
      ),
    );
  }
}
