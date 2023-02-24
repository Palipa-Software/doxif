import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({
    super.key,
    required this.icoPath,
    required this.title,
    required this.value,
  });
  final String icoPath;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                ImageIcon(AssetImage("assets/images/${icoPath}")),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Rubik Bold",
                      color: Color(0xff41443C)),
                )
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                fontFamily: "Rubik Regular",
                color: Color(0xff41443C)),
          ),
        ],
      ),
    );
  }
}
