import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/constants/constants.dart';

class SplashScreenController extends GetxController {
  final PageController pageController = PageController();
  List<dynamic> splashInfo = <Object>[
    {
      "title": AppStrings.splash1Title,
      "subtitle": AppStrings.splash1Subtitle,
      "imageUrl2": "splash-1",
    },
    {
      "title": AppStrings.splash2Title,
      "subtitle": AppStrings.splash2Subtitle,
      "imageUrl": "splash-1-1",
      "imageUrl2": "splash-1-2",
    },
    {
      "title": AppStrings.splash3Title,
      "subtitle": AppStrings.splash3Subtitle,
      "imageUrl": "splash-2-1",
      "imageUrl2": "splash-2-2",
    },
    {
      "title": AppStrings.splash4Title,
      "subtitle": AppStrings.splash4Subtitle,
      "imageUrl": "splash-3-1",
      "imageUrl2": "splash-3-2",
    },
  ];
}
