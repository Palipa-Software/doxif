import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/private_user_string.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(9.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: PrivateUserString.title),
            SizedBox(height: 1.h),
            PrivateUserString.oneTitle,
            SizedBox(height: 1.h),
            PrivateUserString.one,
            SizedBox(height: 1.h),
            PrivateUserString.twoTitle,
            SizedBox(height: 1.h),
            PrivateUserString.two,
            SizedBox(height: 1.h),
            PrivateUserString.threeTitle,
            SizedBox(height: 1.h),
            PrivateUserString.three,
            SizedBox(height: 1.h),
            PrivateUserString.fourTitle,
            SizedBox(height: 1.h),
            PrivateUserString.four,
            SizedBox(height: 1.h),
            PrivateUserString.fiveTitle,
            SizedBox(height: 1.h),
            PrivateUserString.five,
            SizedBox(height: 1.h),
            PrivateUserString.sixTitle,
            SizedBox(height: 1.h),
            PrivateUserString.six,
            SizedBox(height: 1.h),
            PrivateUserString.sevenTitle,
            SizedBox(height: 1.h),
            PrivateUserString.seven,
            SizedBox(height: 1.h),
            PrivateUserString.eightTitle,
            SizedBox(height: 1.h),
            PrivateUserString.eight,
            SizedBox(height: 1.h),
            PrivateUserString.nineTitle,
            SizedBox(height: 1.h),
            PrivateUserString.nine,
            SizedBox(height: 1.h),
            PrivateUserString.tenTitle,
            SizedBox(height: 1.h),
            PrivateUserString.ten,
            SizedBox(height: 1.h),
            PrivateUserString.elevenTitle,
            SizedBox(height: 1.h),
            PrivateUserString.eleven,
            SizedBox(height: 1.h),
            PrivateUserString.twelveTitle,
            SizedBox(height: 1.h),
            PrivateUserString.twelve,
            SizedBox(height: 1.h),
            PrivateUserString.thirteenTitle,
            SizedBox(height: 1.h),
            PrivateUserString.thirteen,
            SizedBox(height: 1.h),
            PrivateUserString.fourteenTitle,
            SizedBox(height: 1.h),
            PrivateUserString.fourteen,
            SizedBox(height: 1.h),
            PrivateUserString.fifteenTitle,
            SizedBox(height: 1.h),
            PrivateUserString.fifteen,
          ],
        ),
      ),
    );
  }
}
