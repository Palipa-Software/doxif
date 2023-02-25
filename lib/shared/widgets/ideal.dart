import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Ideal extends StatelessWidget {
  const Ideal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17.5.w,
      height: 3.h,
      decoration: BoxDecoration(
          color: Color(0xffedf3ea), borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          "İdeal",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Rubik Regular",
              color: Color(0xff50862B)),
        ),
      ),
    );
  }
}
