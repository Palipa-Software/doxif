import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:sizer/sizer.dart';

class CustomRowMenu2 extends StatelessWidget {
  const CustomRowMenu2({
    super.key,
    required this.text,
    required this.ontop,
    required this.pathImage,
  });
  final String text;
  final Function() ontop;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Bounceable(
        onTap: ontop,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageIcon(
                    AssetImage(pathImage),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6A6F7D),
                      fontFamily: "Rubik Regular",
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.5.w),
                child: ImageIcon(AssetImage("assets/images/shape.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
