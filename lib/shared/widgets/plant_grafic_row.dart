import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlantGraficRow extends StatelessWidget {
  const PlantGraficRow({
    super.key,
    required this.imagePath,
    required this.plantName,
    required this.ideality,
  });
  final String imagePath;
  final String plantName;
  final Widget ideality;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, top: 1.h),
      child: Row(
        children: [
          Container(
            height: 4.5.h,
            width: 16.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/${imagePath}"))),
          ),
          SizedBox(
            width: 4.w,
          ),
          Container(
            width: 17.w,
            height: 2.4.h,
            child: Text(
              plantName,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Rubik Regular",
                  color: Color(0xff6A6F7D)),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          ideality
        ],
      ),
    );
  }
}

class SoHot extends StatelessWidget {
  const SoHot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w),
      child: Container(
        width: 30.w,
        height: 3.5.h,
        decoration: BoxDecoration(
            color: Color(0xfffbd9d7),
            borderRadius: BorderRadius.circular(17.sp)),
        child: Center(
          child: Text(
            "Çok Sıcak",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Rubik Regular",
                color: Color(0xffEA4335)),
          ),
        ),
      ),
    );
  }
}

class IdealTempreture extends StatelessWidget {
  const IdealTempreture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w),
      child: Container(
        width: 21.w,
        height: 3.5.h,
        decoration: BoxDecoration(
            color: Color(0xffedf3ea),
            borderRadius: BorderRadius.circular(17.sp)),
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
      ),
    );
  }
}

class VeryCold extends StatelessWidget {
  const VeryCold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w),
      child: Container(
        width: 30.w,
        height: 3.5.h,
        decoration: BoxDecoration(
            color: Color(0xffdaecf7),
            borderRadius: BorderRadius.circular(17.sp)),
        child: Center(
          child: Text(
            "Çok Soğuk",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Rubik Regular",
                color: Color(0xff459ED5)),
          ),
        ),
      ),
    );
  }
}
