import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tutorai/modules/modules.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/constants/strings.dart';

import '../../shared/widgets/widgets.dart';

class AddRegion extends GetView<AddRegionController> {
  const AddRegion({super.key});

  @override
  Widget build(BuildContext context) {
    var plantTypes = Set<String>();
    List<dynamic> plantsList = controller.plants
        .where(
          (plant) => plantTypes.add(
            plant,
          ),
        )
        .toList();
    var variets = Set<String>();
    List<dynamic> variet = controller.tomatoVariet
        .where(
          (variet) => variets.add(
            variet,
          ),
        )
        .toList();
    var varietsPeppers = Set<String>();
    List<dynamic> varietPepper = controller.pepperVariet
        .where(
          (variet) => varietsPeppers.add(
            variet,
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.addRegionTitle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ADD PHOTO
            Obx(
              () => controller.image.value != null
                  ? Container(
                      width: 100.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(controller.image.value!),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 100.w,
                      height: 20.h,
                      child: DottedBorder(
                        color: AppColors.inActiveIcColor,
                        dashPattern: [
                          20,
                        ],
                        child: Bounceable(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/addPhoto.svg"),
                                SizedBox(
                                  height: .7.h,
                                ),
                                Text(
                                  AppStrings.addPhoto,
                                  style: TextStyle(
                                    fontFamily: "Rubik Regular",
                                    color: AppColors.addPhoto,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            // INPUTS
            SizedBox(
              height: 1.5.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                hintText: AppStrings.regionName,
                hintStyle: TextStyle(
                  color: AppColors.addPhoto,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.appColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.coldMorning),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.sp),
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              style: TextStyle(
                color: AppColors.addPhoto,
              ),
              controller: controller.regionName,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: .5.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.sp,
                  ),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.coldMorning,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    elevation: 12,
                    borderRadius: BorderRadius.circular(
                      12.sp,
                    ),
                    icon: const SizedBox(),
                    isExpanded: true,
                    value: controller.plantTypeFirst.value,
                    items: plantTypes.map((plant) {
                      return DropdownMenuItem(
                        value: plant,
                        child: Text(
                          plant,
                          style: TextStyle(
                            color: AppColors.addPhoto,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.plantTypeFirst.value = value.toString();
                      controller.plantType.value = value.toString();
                      print(value);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: .5.h,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.sp,
                    ),
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.coldMorning,
                    )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    elevation: 12,
                    borderRadius: BorderRadius.circular(
                      12.sp,
                    ),
                    icon: const SizedBox(),
                    isExpanded: true,
                    value: controller.plantTypeFirst.value == "Domates"
                        ? controller.varietTomato.value
                        : controller.varietPepper.value,
                    items: controller.plantTypeFirst.value == "Domates"
                        ? variets.map((variet) {
                            return DropdownMenuItem(
                              child: Text(
                                variet,
                                style: TextStyle(
                                  color: AppColors.addPhoto,
                                ),
                              ),
                              value: variet,
                            );
                          }).toList()
                        : varietsPeppers.map((variet) {
                            return DropdownMenuItem(
                              child: Text(
                                variet,
                                style: TextStyle(
                                  color: AppColors.addPhoto,
                                ),
                              ),
                              value: variet,
                            );
                          }).toList(),
                    onChanged: (value) {
                      controller.plantVariet.value = value.toString();
                      controller.plantTypeFirst.value == "Domates"
                          ? controller.varietTomato.value = value.toString()
                          : controller.varietPepper.value = value.toString();
                      print(value);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              width: 100.w,
              height: 6.5.h,
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: .5.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.coldMorning,
                ),
                borderRadius: BorderRadius.circular(
                  12.sp,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.plantingDate,
                    style: TextStyle(
                      color: AppColors.addPhoto,
                      fontFamily: "Rubik Regular",
                      fontSize: 11.sp,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.selectedDate.value,
                      style: TextStyle(
                        color: AppColors.addPhoto,
                        fontFamily: "Rubik Regular",
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () {
                      Get.defaultDialog(
                        title: AppStrings.plantingDate,
                        titleStyle: TextStyle(
                          fontFamily: "Rubik Bold",
                          color: AppColors.addPhoto,
                        ),
                        content: SizedBox(
                          width: 80.w,
                          height: 30.h,
                          child: SfDateRangePicker(
                            onViewChanged: (dateRangePickerViewChangedArgs) {
                              print("view");
                            },
                            onSelectionChanged:
                                (dateRangePickerSelectionChangedArgs) {
                              if (dateRangePickerSelectionChangedArgs.value
                                  is DateTime) {
                                controller.selectedDate.value =
                                    DateFormat('dd/MM/yyyy').format(
                                        dateRangePickerSelectionChangedArgs
                                            .value);
                                print(
                                    "selectedDate:${controller.selectedDate.value}");
                              }
                            },
                            todayHighlightColor: AppColors.appColor,
                            selectionColor: AppColors.appColor,
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/images/calendar.svg"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
              controller: controller,
              func: () {
                controller.successDialog();
              },
              title: AppStrings.addRegionTitle,
            ),
          ],
        ),
      ),
    );
  }
}
