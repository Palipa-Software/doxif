import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:search_page/search_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tutorai/main.dart';
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
                      controller.searchVariets =
                          snapshot.data?.docs[0]["plantsVariet"];
                      controller.type = snapshot.data?.docs[0]["name"];
                      return Container(
                        width: 100.w,
                        height: 6.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Bounceable(
                                onTap: () {
                                  controller.index2.value = 0;
                                  controller.type =
                                      snapshot.data?.docs[index]["name"];
                                  print("Type:${controller.type}");
                                  controller.variets.clear();
                                  controller.index.value = index;
                                  controller.searchVariets = snapshot
                                          .data?.docs[controller.index.value]
                                      ["plantsVariet"];
                                  print(
                                      "searchVariets:${controller.searchVariets}");

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
                TextFormField(
                  controller: controller.variet,
                  decoration: InputDecoration(
                    hintText: AppStrings.plantsVariet,
                    prefixIcon: Bounceable(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: SearchPage(
                            onQueryUpdate: print,
                            searchLabel: "Çeşitleri Ara",
                            items: controller.searchVariets,
                            suggestion: ListView.builder(
                              itemCount: controller.searchVariets.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    controller.variet.text =
                                        controller.searchVariets[index];
                                    Get.back();
                                  },
                                  title: Text(controller.searchVariets[index]),
                                );
                              },
                            ),
                            failure: Center(
                              child: Bounceable(
                                onTap: () {},
                                child: Text(
                                  'Aradığınız Çeşit Listede Bulunamadı',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Rubik Italic",
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            filter: (val) => [
                              val.toString(),
                            ],
                            sort: (a, b) => a.compareTo(b),
                            builder: (val) {
                              return ListTile(
                                onTap: () {
                                  print("ddd:$val");
                                  controller.variet.text = val;
                                  Get.back();
                                },
                                title: Text(val),
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 15.w,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.searchList,
                          style: TextStyle(
                            color: AppColors.appColor,
                            fontFamily: "Rubik Bold",
                            fontSize: 7.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.coldMorning),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.sp),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12.sp,
                      ),
                      borderSide: BorderSide(
                        color: AppColors.appColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12.sp,
                      ),
                    ),
                    focusColor: AppColors.appColor,
                  ),
                  style: TextStyle(
                    color: AppColors.addPhoto,
                    fontFamily: "Rubik Regular",
                    fontSize: 12.sp,
                  ),
                ),

                // StreamBuilder<QuerySnapshot>(
                //   stream: controller.stream,
                //   builder: (BuildContext context,
                //       AsyncSnapshot<QuerySnapshot> snapshot) {
                //     if (snapshot.hasError) {
                //       print("Error");
                //     }

                //     if (snapshot.hasData) {
                //       return Obx(
                //         () => Container(
                //           width: 100.w,
                //           height: 6.h,
                //           child: ListView.builder(
                //             scrollDirection: Axis.horizontal,
                //             itemCount: snapshot
                //                 .data
                //                 ?.docs[controller.index.value]["plantsVariet"]
                //                 .length,
                //             itemBuilder: (context, index) {
                //               return Obx(
                //                 () => Bounceable(
                //                   onTap: () {
                //                     controller.variet.text = snapshot
                //                             .data?.docs[controller.index.value]
                //                         ["plantsVariet"][index];
                //                     print(index);
                //                     print(controller.variet);
                //                     controller.index2.value = index;
                //                   },
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color: index == controller.index2.value
                //                             ? AppColors.appColor
                //                             : AppColors.white,
                //                         borderRadius: BorderRadius.circular(
                //                           12.sp,
                //                         ),
                //                         border: Border.all(
                //                           color: AppColors.coldMorning,
                //                         )),
                //                     padding: EdgeInsets.symmetric(
                //                       horizontal: 3.w,
                //                       vertical: 2.h,
                //                     ),
                //                     margin: EdgeInsets.only(
                //                       right: 2.w,
                //                     ),
                //                     child: Text(
                //                       (snapshot.data
                //                                   ?.docs[controller.index.value]
                //                               ["plantsVariet"][index])
                //                           .toString(),
                //                       style: TextStyle(
                //                         color: index == controller.index2.value
                //                             ? AppColors.white
                //                             : AppColors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //           ),
                //         ),
                //       );
                //     }
                //     return Center(
                //       child: CircularProgressIndicator(
                //         color: AppColors.appColor,
                //       ),
                //     );
                //   },
                // ),
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
                          localization.translate(
                            "tr",
                            countryCode: "TR",
                          );
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
                                headerStyle: DateRangePickerHeaderStyle(
                                    textStyle: TextStyle(
                                  color: AppColors.addPhoto,
                                  fontFamily: "Rubik Bold",
                                  fontSize: 12.sp,
                                )),
                                monthViewSettings:
                                    DateRangePickerMonthViewSettings(
                                  viewHeaderStyle:
                                      DateRangePickerViewHeaderStyle(
                                    textStyle: TextStyle(
                                      color: AppColors.addPhoto,
                                      fontFamily: "Rubik Bold",
                                    ),
                                  ),
                                  dayFormat: "EEE",
                                ),
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
                                monthCellStyle: DateRangePickerMonthCellStyle(
                                  todayTextStyle: TextStyle(
                                    color: AppColors.appColor,
                                    fontFamily: "Rubik Regular",
                                  ),
                                ),
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
