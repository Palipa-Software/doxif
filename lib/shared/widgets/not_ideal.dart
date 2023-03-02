import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotIdeal extends StatelessWidget {
  const NotIdeal({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21.5.w,
      height: 2.9.h,
      decoration: BoxDecoration(
          color: Color(0xfffbd9d7), borderRadius: BorderRadius.circular(17.sp)),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Rubik Regular",
              color: Color(0xffEA4335)),
        ),
      ),
    );
  }
}
