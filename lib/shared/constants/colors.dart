import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color covetedGem = const Color(0xFFB6B4C0);
  static Color delftBlue = const Color(0xFF3519E3);
  static Color bgColor = const Color(0xFFE1E1E1);
  static Color purplishBlue = const Color(0xFF5940F4); // linear 1
  static Color venetianNights = const Color(0xFF705AF8); // linear 2
  static Color ultraIndigo = const Color(0xFF4A2DFF); // linear 3
  static Color gravelFint = const Color(0xFFBBBBBB);
  static Color pinkOcd = const Color(0xFF6952F7);
  static Color inputTitleColor = const Color(0xFF222222);
  static Color goshawkGrey = const Color(0xFF444444);
  static Color qingDynastyDragon = const Color(0xFF3D58E3);
  static Color lead = const Color(0xFF212121);
  static Color namaraGrey = const Color(0xFF7C7C7C);
  static Color bauhaus = const Color(0xFF3F3F3F);
  static Color potBlack = const Color(0xFF161616);

  // static Color sodaliteBlue = Color(0xFF25316D);
  // static Color oceanNight = Color(0xFF5F6F94);
  // static Color effervescentBlue = Color(0xFF002B5B);
  // static Color lakeView = Color(0xFF2B4865);
  // static Color seaGoddess = Color(0xFF256D85);
  // static Color beachGlass = Color(0xFF8FE3CF);
  // static Color elementalGrey = Color(0xFFA0A0A0);

  // //App Dark Light Color
  // static Color lightScaffoldBackgroundColor = Color(0xFFFDEBEC);
  // static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  // static Color secondaryAppColor = hexToColor('#22DDA6');
  // static Color secondaryDarkAppColor = Colors.white;
  // static Color tipColor = hexToColor('#B6B6B6');
  // static Color lightGray = Color(0xFFF6F6F6);
  // static Color darkGray = Color(0xFF9F9F9F);
  // static Color white = Color(0xFFFFFFFF);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
