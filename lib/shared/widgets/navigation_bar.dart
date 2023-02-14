import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:sizer/sizer.dart';

class NaviBar extends StatelessWidget {
  NaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.sp),
        topLeft: Radius.circular(30.sp),
      ),
      child: BottomAppBar(
        height: 9.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bounceable(
                child: ImageIcon(
                  AssetImage("assets/images/homeIco.png"),
                  color: Color(0xff6A6F7D),
                ),
                onTap: () {},
              ),
              Bounceable(
                child: ImageIcon(
                  AssetImage("assets/images/qrIco.png"),
                  color: Color(0xff6A6F7D),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
