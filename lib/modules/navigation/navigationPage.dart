import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seramcepte/modules/addSensor/addSensor.dart';
import 'package:seramcepte/modules/homeScreen/home_screen.dart';
import 'package:seramcepte/modules/menuScreen/menu_screen.dart';
import 'package:seramcepte/modules/navigation/navigation_controller.dart';
import 'package:seramcepte/routes/routes.dart';
import 'package:seramcepte/shared/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/constants.dart';

class NavigationPage extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());
  NavigationPage({super.key});

  final screens = [
    HomeScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(
        controller: AddSensorController(),
        func: () {
          Get.toNamed(Routes.ADDSENSOR);
        },
      ),
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              4.h,
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: controller.selectedIndex.value,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/home.svg",
                  color: controller.selectedIndex.value == 0
                      ? AppColors.appColor
                      : AppColors.inActiveIcColor,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/menu.svg",
                  color: controller.selectedIndex.value == 1
                      ? AppColors.appColor
                      : AppColors.inActiveIcColor,
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
