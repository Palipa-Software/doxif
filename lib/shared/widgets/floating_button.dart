import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      elevation: 0,
      child: Container(
        height: 4.h,
        width: 10.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffF8F8F8),
                blurRadius: 20.0.sp,
                spreadRadius: 2.0.sp,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.sp))),
        child: ImageIcon(
          AssetImage("assets/images/floatIco.png"),
          color: Color(0xff6A6F7D),
        ),
      ),
      onPressed: () {},
    );
  }
}
