import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextMenuDetail extends StatelessWidget {
  const CustomTextMenuDetail({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xff6A6F7D),
        fontFamily: "Rubik Regular",
      ),
    );
  }
}
