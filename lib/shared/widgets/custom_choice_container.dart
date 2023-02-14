import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:sizer/sizer.dart';

class CustomChoiceContainer extends StatelessWidget {
  const CustomChoiceContainer({
    super.key,
    required this.text,
    required this.icoPath,
    required this.textColor,
    required this.backgroundColor,
    required this.icoColor,
    required this.onTop,
  });
  final String text;
  final String icoPath;
  final Color textColor;
  final Color backgroundColor;
  final Color icoColor;
  final Function() onTop;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTop,
      child: Container(
        width: 28.w,
        height: 8.6.h,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(2.sp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage("assets/images/${icoPath}"),
              color: icoColor,
            ),
            SizedBox(
              height: 2.sp,
            ),
            Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: 10.sp,
                  fontFamily: "Rubik Regular",
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
