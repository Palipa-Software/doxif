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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: controller.currentBottomTab.value,
          onTap: (value) {
            controller.scanBtn.value = false;
            controller.currentBottomTab.value = value;
            print(controller.currentBottomTab.value);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/home.svg",
                color: controller.scanBtn.value == true
                    ? AppColors.inActiveIcColor
                    : controller.currentBottomTab.value == 0
                        ? AppColors.appColor
                        : AppColors.inActiveIcColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/menu.svg",
                color: controller.scanBtn.value == true
                    ? AppColors.inActiveIcColor
                    : controller.currentBottomTab.value == 1
                        ? AppColors.appColor
                        : AppColors.inActiveIcColor,
              ),
              label: "",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => Container(
          padding: EdgeInsets.all(2.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: Container(
            padding: EdgeInsets.all(
              2.sp,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bgColor,
            ),
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                controller.scanBtn.value == true
                    ? controller.scanBtn.value = false
                    : controller.scanBtn.value = true;
                print(controller.scanBtn.value);
              },
              child: SvgPicture.asset(
                "assets/images/scan.svg",
                color: controller.scanBtn.value == true
                    ? AppColors.appColor
                    : AppColors.inActiveIcColor,
              ),
              backgroundColor: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
