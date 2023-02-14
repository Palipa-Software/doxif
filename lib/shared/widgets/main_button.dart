import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
        backgroundColor: AppColors.appColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontFamily: "Rubik Regular"),
      ),
    );
  }
}
