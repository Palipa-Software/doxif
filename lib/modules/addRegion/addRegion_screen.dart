import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/constants/strings.dart';

import '../../shared/widgets/widgets.dart';
import 'addRegion_controller.dart';

class AddRegion extends GetView<AddRegionController> {
  final controller = Get.put(AddRegionController());
  AddRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.addRegionTitle,
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
            ),
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ADD PHOTO
                Obx(() {
                  return controller.plantImagePath.value != ""
                      ? Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/${controller.plantImage}.png"),
                            ),
                          ),
                        )
                      : Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/biber.png"),
                            ),
                          ),
                        );
                }),
                // INPUTS
                SizedBox(
                  height: 1.5.h,
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: controller.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print("Error");
                    }

                    if (snapshot.hasData) {
                      return Container(
                        width: 100.w,
                        height: 6.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            controller.type = snapshot.data?.docs[0]["name"];
                            return Obx(
                              () => Bounceable(
                                onTap: () {
                                  controller.index2.value = 0;
                                  controller.type =
                                      snapshot.data?.docs[index]["name"];
                                  print("Type:${controller.type}");
                                  controller.variets.clear();
                                  controller.index.value = index;
                                  print(snapshot
                                      .data
                                      ?.docs[controller.index.value]
                                          ["plantsVariet"]
                                      .toString());
                                  snapshot
                                      .data
                                      ?.docs[controller.index.value]
                                          ["plantsVariet"]
                                      .map((variet) {
                                    controller.variets.add(variet);
                                  });
                                  controller.getImage();

                                  print(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 2.h,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 2.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: index == controller.index.value
                                        ? AppColors.appColor
                                        : AppColors.white,
                                    border: Border.all(
                                      color: AppColors.coldMorning,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      12.sp,
                                    ),
                                  ),
                                  child: Text(
                                    snapshot.data?.docs[index]["name"],
                                    style: TextStyle(
                                      color: index == controller.index.value
                                          ? AppColors.white
                                          : AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
                SizedBox(
                  height: 1.5.h,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: controller.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print("Error");
                    }

                    if (snapshot.hasData) {
                      return Obx(
                        () => Container(
                          width: 100.w,
                          height: 6.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot
                                .data
                                ?.docs[controller.index.value]["plantsVariet"]
                                .length,
                            itemBuilder: (context, index) {
                              controller.variet =
                                  (snapshot.data?.docs[controller.index.value]
                                          ["plantsVariet"][0])
                                      .toString();

                              return Obx(
                                () => Bounceable(
                                  onTap: () {
                                    controller.variet = snapshot
                                            .data?.docs[controller.index.value]
                                        ["plantsVariet"][index];
                                    print(index);
                                    print(controller.variet);
                                    controller.index2.value = index;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: index == controller.index2.value
                                            ? AppColors.appColor
                                            : AppColors.white,
                                        borderRadius: BorderRadius.circular(
                                          12.sp,
                                        ),
                                        border: Border.all(
                                          color: AppColors.coldMorning,
                                        )),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 3.w,
                                      vertical: 2.h,
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 2.w,
                                    ),
                                    child: Text(
                                      (snapshot.data
                                                  ?.docs[controller.index.value]
                                              ["plantsVariet"][index])
                                          .toString(),
                                      style: TextStyle(
                                        color: index == controller.index2.value
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    color: AppColors.addPhoto,
                  ),
                  controller: controller.regionName,
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
                  func: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColors.appColor,
                        ));
                      },
                    );
                    try {
                      await controller.handleAddRegion();
                    } catch (e) {
                      print(e);
                    }
                  },
                  title: AppStrings.addRegionTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
