import 'package:get/get.dart';
import 'package:tutorai/modules/menuScreen/menu_screen.dart';
import 'package:tutorai/modules/menuScreen/menu_screen_binding.dart';

import '../modules/splashScreen/splash.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.MENU;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => const MenuScreen(),
      binding: MenuScreenBinding(),
    ),
  ];
}
