import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/shared/widgets/custom_text_menu_detail.dart';

class MenuCustomRow extends StatelessWidget {
  MenuCustomRow({super.key, required this.text, required this.onTap});
  final String text;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 1.5.h),
      child: Bounceable(
        onTap: onTap,
        child: Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextMenuDetail(
                text: text,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.5.w),
                child: const ImageIcon(AssetImage("assets/images/shape.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
