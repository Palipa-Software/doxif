import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:seramcepte/modules/homeDetailScreen/home_detail_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/addRegion/addRegion.dart';
import 'package:seramcepte/modules/addSensor/addSensor.dart';
import 'package:seramcepte/modules/homeScreen/home_screen_controller.dart';
import 'package:seramcepte/modules/menuScreen/menu_screen_controller.dart';
import 'package:seramcepte/routes/routes.dart';
import 'package:seramcepte/shared/constants/colors.dart';
import 'package:seramcepte/shared/widgets/custom_floating_button.dart';
import 'package:seramcepte/modules/homeScreen/plant_card.dart';

import '../../shared/constants/data_model.dart';
import '../../shared/constants/firestore_service.dart';
import '../../shared/widgets/custom_bottom_nav_bar.dart';
import '../../shared/widgets/custom_choice_container.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddRegionController addRegionController = AddRegionController();
    final user = FirebaseAuth.instance.currentUser!;

    HomeScreenController controller = Get.put(HomeScreenController());
    MenuScreenController menuScreenController = MenuScreenController();
    final FirestoreService firestoreService = FirestoreService();
    final List<String> items = ['Aydın Dağ Çilek', 'Kumluca Cam Domates'];
    final selected = Get.put(0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF8F8F8),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(
                  image: const AssetImage(
                    "assets/images/greenBar.png",
                  ),
                  width: double.infinity,
                  height: 21.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    height: 12.h,
                    width: 28.w,
                    child: const Image(
                      image: AssetImage("assets/images/ellipse1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image(
                    image: AssetImage("assets/images/ellipse2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 6.w,
                  top: 7.h,
                  child: Bounceable(
                    onTap: () {},
                    child: Container(
                      height: 4.h,
                      width: 8.5.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/ellipse3.png"),
                              fit: BoxFit.fill)),
                      child: Center(
                          child: ImageIcon(
                        const AssetImage("assets/images/notificationIco.png"),
                        color: AppColors.white,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 19.w, top: 8.h),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hoşgeldin,",
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: "Rubik Regular",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 3.sp,
                            ),
                            FutureBuilder<DocumentSnapshot>(
                                future: menuScreenController.users
                                    .doc(user.uid)
                                    .get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text("Somethink went wrong");
                                  }
                                  if (snapshot.hasData) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    return Text(
                                      data["name"],
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: "Rubik Bold",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                }),
                            SizedBox(
                              width: 3.sp,
                            ),
                            Text(
                              "👋",
                              style: TextStyle(
                                fontFamily: "Rubik Bold",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.sp,
                        ),
                        Text(
                          "Arazini Anlık Takip Et!",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: "Rubik Italic",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Container(
                height: 8.6.h,
                color: const Color(0x00fff8f8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomChoiceContainer(
                      backgroundColor: const Color(0xff2DDA93),
                      text: "Sensör Ekle",
                      icoColor: AppColors.white,
                      icoPath: "sensorIco.png",
                      textColor: AppColors.white,
                      onTop: () {
                        Get.toNamed(Routes.ADDSENSOR);
                      },
                    ),
                    CustomChoiceContainer(
                      backgroundColor: AppColors.white,
                      text: "Bölge Ekle",
                      icoColor: const Color(0xff2DDA93),
                      icoPath: "regionIco.png",
                      textColor: const Color(0xff6A6F7D),
                      onTop: () {
                        Get.toNamed(Routes.ADDREGION);
                      },
                    ),
                    CustomChoiceContainer(
                      backgroundColor: AppColors.white,
                      text: "Uyarılar",
                      icoColor: const Color(0xff2DDA93),
                      icoPath: "dangerIco.png",
                      textColor: const Color(0xff6A6F7D),
                      onTop: () {
                        Get.toNamed(
                          Routes.WARNING,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<Data>>(
              stream: FirestoreService().getStreamData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Bir hata oluştu.'));
                }

                if (snapshot.hasData) {
                  List<Data> data = snapshot.data ?? [];

                  return Expanded(
                    child: Obx(() {
                      return controller.results.isEmpty ||
                              controller.searchText.value == ''
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.myDataList.length,
                              itemBuilder: (context, index) {
                                print(
                                    "FIREBASE NEM DURUMU:${controller.myDataList[index].maxNem}");
                                return Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Obx(
                                    () => PlantCard(
                                        highHumidity:
                                            controller.myDataList[index].maxNem,
                                        highTemp:
                                            controller.myDataList[index].maxSic,
                                        lowHumidity:
                                            controller.myDataList[index].minNem,
                                        lowTemp:
                                            controller.myDataList[index].minSic,
                                        onTap: () async {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: AppColors.appColor,
                                              ));
                                            },
                                          );
                                          try {
                                            await controller.fetchData(
                                                sensorID: controller
                                                    .myDataList[index]
                                                    .sensorId);
                                          } catch (e) {
                                            print("HATALI BİR DURUM VAR");
                                          }

                                          Get.toNamed(Routes.HOMEDETAIL,
                                              arguments: [
                                                controller.myDataList[index]
                                                    .regionName,
                                                controller.myDataList[index]
                                                    .plantType,
                                                controller
                                                    .myDataList[index].sensorId,
                                                controller.hoursData,
                                                controller.weeklyData,
                                              ]);
                                        },
                                        sensorId: controller
                                            .myDataList[index].sensorId,
                                        imagePath:
                                            "${controller.myDataList[index].plantType.toString().toLowerCase()}.png",
                                        regionName: controller
                                            .myDataList[index].regionName,
                                        plantName: controller
                                            .myDataList[index].plantType),
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.results.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 4.h),
                                  child: Obx(
                                    () => PlantCard(
                                      highHumidity:
                                          controller.myDataList[index].maxNem,
                                      highTemp:
                                          controller.myDataList[index].maxSic,
                                      lowHumidity:
                                          controller.myDataList[index].minNem,
                                      lowTemp:
                                          controller.myDataList[index].minSic,
                                      onTap: () async {
                                        try {
                                          await controller.fetchData(
                                              sensorID: controller
                                                  .myDataList[index].sensorId);
                                        } catch (e) {
                                          print("HATALI BİR DURUM VAR");
                                        }

                                        Get.toNamed(Routes.HOMEDETAIL,
                                            arguments: [
                                              controller.results[index]
                                                  ["regionName"],
                                              controller.results[index]
                                                  ["plantType"],
                                              controller.results[index]
                                                  ["sensorId"],
                                            ]);
                                      },
                                      sensorId: controller.results[index]
                                          ["sensorId"],
                                      imagePath:
                                          "${controller.results[index]["plantType"].toString().toLowerCase()}.png",
                                      regionName: controller.results[index]
                                          ["regionName"],
                                      plantName: controller.results[index]
                                          ["plantType"],
                                    ),
                                  ),
                                );
                              },
                            );
                    }),
                  );
                }
                return Container(
                  height: 10.h,
                  width: 10.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.appColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 6.w, right: 6.w),
          child: Container(
            height: 6.2.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(25.sp),
            ),
            child: Center(
              child: TextField(
                textCapitalization: TextCapitalization.words,
                onChanged: controller.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Arazi ara...',
                  hintStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffD2D2D2),
                      fontFamily: "Rubik Italic"),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffD2D2D2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: CustomFloatingButton(controller: AddSensorController()),
      // bottomNavigationBar: CustomBottomNavigationBar(controller: AddSensorController()),
    );
  }
}
