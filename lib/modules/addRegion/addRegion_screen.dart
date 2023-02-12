import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:search_choices/search_choices.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/constants/strings.dart';

import '../../shared/widgets/widgets.dart';
import 'addRegion_controller.dart';

class AddRegion extends GetView<AddRegionController> {
  const AddRegion({super.key});

  @override
  Widget build(BuildContext context) {
    var plantTypes = Set<String>();
    List<dynamic> plantsList = controller.deneme
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
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getPlants(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            for (var i = 0; i < controller.index.value; i++) {
              controller.deneme.add(snapshot.data?.docs[i]["name"]);
              print(controller.deneme);
            }
            controller.index.value = snapshot.data!.docs.length;
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ADD PHOTO
                  Obx(
                    () {
                      return controller.plantImagePath.value != ""
                          ? Container(
                              width: 100.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/${controller.plantImage}.png",
                                  ),
                                ),
                              ),
                            )
                          // : Container(
                          //     width: 100.w,
                          //     height: 20.h,
                          //     child: SearchChoices.single(
                          //       items: plantTypes.map((plant) {
                          //         return DropdownMenuItem(
                          //           value: plant,
                          //           child: Text(
                          //             plant,
                          //             style: TextStyle(
                          //               color: AppColors.addPhoto,
                          //             ),
                          //           ),
                          //         );
                          //       }).toList(),
                          //     ),
                          //   );
                          : Container(
                              width: 100.w,
                              height: 30.h,
                              child: ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    snapshot.data?.docs[index]["name"],
                                  );
                                },
                              ),
                            );
                    },
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
                            controller.getImage();

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
                                ? controller.varietTomato.value =
                                    value.toString()
                                : controller.varietPepper.value =
                                    value.toString();
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
                                  onViewChanged:
                                      (dateRangePickerViewChangedArgs) {
                                    print("view");
                                  },
                                  onSelectionChanged:
                                      (dateRangePickerSelectionChangedArgs) {
                                    if (dateRangePickerSelectionChangedArgs
                                        .value is DateTime) {
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
                    func: () async {
                      await controller.addRegion();
                    },
                    title: AppStrings.addRegionTitle,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.appColor,
            ),
          );
        },
      ),
    );
  }
}
