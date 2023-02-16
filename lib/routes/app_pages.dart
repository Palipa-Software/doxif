import 'package:get/get.dart';
import 'package:tutorai/modules/addRegion/addRegion.dart';
import 'package:tutorai/modules/addSensor/addSensor.dart';
import 'package:tutorai/modules/login/login_binding.dart';
import 'package:tutorai/modules/login/login_screen.dart';
import 'package:tutorai/modules/warning/warning.dart';

import '../modules/homeScreen/home_screen.dart';
import '../modules/homeScreen/home_screen_binding.dart';

import 'package:tutorai/modules/main_page/main_page_binding.dart';
import 'package:tutorai/modules/main_page/main_page_screen.dart';
import 'package:tutorai/modules/register/register_binding.dart';
import 'package:tutorai/modules/register/register_screen.dart';

import '../modules/menuScreen/menu_screen.dart';
import '../modules/menuScreen/menu_screen_binding.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names

  static const INITIAL = Routes.WARNING;

  static final routes = [
    GetPage(
      name: Routes.MAINPAGE,
      page: () => const MainPageScreen(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => const MenuScreen(),
      binding: MenuScreenBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.ADDSENSOR,
      page: () => const AddSensor(),
      binding: AddSensorBinding(),
    ),
    GetPage(
      name: Routes.ADDREGION,
      page: () => AddRegion(),
      binding: AddRegionBinding(),
    ),
    GetPage(
      name: Routes.WARNING,
      page: () => WarningScreen(),
      binding: WarningBinding(),
    ),
  ];
}
