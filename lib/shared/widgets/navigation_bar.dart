import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/homeScreen/home_screen.dart';

import '../../modules/menuScreen/menu_screen_controller.dart';

class NaviBar extends GetView<MenuScreenController> {
  NaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.sp),
        topLeft: Radius.circular(30.sp),
      ),
      child: BottomAppBar(
        height: 9.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bounceable(
                child: ImageIcon(
                  AssetImage("assets/images/homeIco.png"),
                  color: Color(0xff6A6F7D),
                ),
                onTap: () {
                  Get.to(HomeScreen(), arguments: [controller.userName.value]);
                },
              ),
              Bounceable(
                child: ImageIcon(
                  AssetImage("assets/images/qrIco.png"),
                  color: Color(0xff6A6F7D),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
