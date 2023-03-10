import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/shared/constants/kvkkString.dart';

class KvkkScreen extends StatelessWidget {
  const KvkkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(top: 2.8.h, left: 4.w),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Text(
            "KVKK",
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
          padding: EdgeInsets.all(8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KvkkStrings.oneTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.one,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.twoTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.two,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.threeTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.three,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.fourTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.four,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.infoTitle,
              KvkkStrings.four2,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.fiveTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.five,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.sixTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.six,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.sevenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.seven,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.eightTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.eight,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.nineTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.nine,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.tenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.ten,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.elevenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.eleven,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.twelveTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.twelve,
              SizedBox(
                height: 1.h,
              ),
              Text(
                "VERİ SORUMLUSU  :AHMET TUĞRUL OKUR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),
              Text(
                "E-POSTA                   :atugrulokur@proton.com",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),
              Text(
                "İLETİŞİM NO            :+90 537 047 6317 ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.twelve2,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.thirteenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.thirteen,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.fourteenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.fourteen,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.fifteenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.fifteen,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.sixteenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.sixteen,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.seventeenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.seventeen,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.eightteenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.eightteen,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.nineteenTitle,
              SizedBox(
                height: 1.h,
              ),
              KvkkStrings.nineteen
            ],
          ),
        ),
      ),
    );
  }
}
