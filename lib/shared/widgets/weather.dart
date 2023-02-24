import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Weather extends StatelessWidget {
  const Weather({
    super.key,
    required this.child,
    required this.clock,
    required this.value,
  });
  final Widget child;
  final String clock;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          clock,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Rubik Regular",
              color: Color(0xff41443C)),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        child,
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          "${value}°",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              fontFamily: "Rubik Regular",
              color: Color(0xff41443C)),
        )
      ],
    );
  }
}
