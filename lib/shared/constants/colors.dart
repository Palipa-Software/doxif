import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color red = const Color(0xFFFF0000);
  static Color appColor = const Color(0xFF2DDA93);
  static Color bgColor = const Color(0xFFF8F8F8);
  static Color inActiveIcColor = const Color(0xFF6A6F7D);
  static Color addPhoto = const Color(0xFF172B4D);
  static Color arrowBack = const Color(0xFF292323);
  static Color coldMorning = const Color(0xFFE5E5E5);
  static Color warningCardTitle = const Color(0xFF292323);
  static Color textFieldColor = const Color(0xFF7A869A);
  static Color softBoiled = const Color(0xFFFFB838);
  static Color peacefulRiver = const Color(0xFF459ED5);
  static Color freshOnion = const Color(0xFF528532);
  static Color emperador = const Color(0xFF78573A);
  static Color alizarin = const Color(0xFFE6463D);
  static Color mintJelly = const Color(0xFF3FD996);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
