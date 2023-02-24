import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/menuScreen/menu_screen_controller.dart';
import 'package:tutorai/routes/routes.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/widgets/navigation_bar.dart';

import '../../shared/widgets/custom_row_menu2.dart';
import '../../shared/widgets/floating_button.dart';

class MenuScreen extends GetView<MenuScreenController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MenuScreenController());
    Get.put(MenuScreenController());
    final user = FirebaseAuth.instance.currentUser!;
    Get.put(MenuScreenController());
    return Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(
              "MENÜ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: "Rubik Bold",
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bounceable(
                  onTap: () {},
                  child: Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4.5.w, top: 2.5.h),
                          child: Image.asset("assets/images/avatar.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, top: 2.5.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<DocumentSnapshot>(
                                  future: controller.users.doc(user.uid).get(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot) {
                                    if (snapshot.hasError) {
                                      return Text("Somethink went wrong");
                                    }
                                    if (snapshot.hasData) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      controller.userName.value = data["name"];
                                      return Text(
                                        data["name"],
                                        style: TextStyle(
                                          fontSize: 13.5.sp,
                                          fontFamily: "Rubik Bold",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    }
                                    return SizedBox();
                                  }),
                              SizedBox(height: 0.5.h),
                              Text(
                                "Profil Bilgileri",
                                style: TextStyle(
                                  color: const Color(0xff6A6F7D),
                                  fontSize: 10.sp,
                                  fontFamily: "Rubik Regular ",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.5.h, left: 31.w),
                          child: const ImageIcon(
                              AssetImage("assets/images/down.png")),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Hesap Bilgileri",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff6A6F7D),
                    fontFamily: "Rubik Regular ",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 18.h,
                  width: 150.w,
                  padding: EdgeInsets.only(top: 2.h),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomRowMenu2(
                            text: "Bölgeler",
                            ontop: () {},
                            pathImage: "assets/images/regionIco.png",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomRowMenu2(
                            text: "Sensörler",
                            ontop: () {},
                            pathImage: "assets/images/sensorIco.png",
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomRowMenu2(
                            text: "İstatistikler",
                            ontop: () {},
                            pathImage: "assets/images/analyz.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Genel Bilgiler",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff6A6F7D),
                    fontFamily: "Rubik Regular ",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 30.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.5.h),
                            child: CustomRowMenu2(
                              text: "Uygulama Hakkında",
                              pathImage: "assets/images/appInfoIco.png",
                              ontop: () {},
                            ),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          CustomRowMenu2(
                              text: "Sıkça Sorulan Sorular",
                              ontop: () {},
                              pathImage: "assets/images/questionIco.png"),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          CustomRowMenu2(
                              text: "Gizlilik Politikası",
                              ontop: () {},
                              pathImage: "assets/images/privateIco.png"),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          CustomRowMenu2(
                              text: "Kullanıcı Sözleşmesi",
                              ontop: () {},
                              pathImage: "assets/images/politicaIco.png"),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Bounceable(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Get.offAllNamed(Routes.MAINPAGE);
                              },
                              child: Container(
                                color: AppColors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/images/nextIco.png"),
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          "Çıkış Yap",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                            fontFamily: "Rubik Regular",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 2.5.w),
                                      child: const ImageIcon(
                                        AssetImage("assets/images/shape.png"),
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Bounceable(
                  onTap: () {
                    controller.deleteUser();
                  },
                  child: Text(
                    "Hesabı Sil",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: "Rubik Regular",
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6A6F7D),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: NaviBar());
  }
}
