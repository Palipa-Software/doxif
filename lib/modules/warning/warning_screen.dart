import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/warning/warning.dart';
import 'package:seramcepte/shared/constants/strings.dart';

import '../../shared/widgets/widgets.dart';

class WarningScreen extends GetView<WarningController> {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.warningTitle),
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Obx(
          () => ListView.builder(
            padding: EdgeInsets.only(
              top: 1.h,
            ),
            itemCount: controller.warningList.length,
            itemBuilder: (context, index) {
              return CustomWarningCard(
                controller: controller,
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
