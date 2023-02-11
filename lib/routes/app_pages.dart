import 'package:get/get.dart';
import 'package:tutorai/modules/addSensor/addSensor_binding.dart';
import 'package:tutorai/modules/addSensor/addSensor_screen.dart';
import 'package:tutorai/modules/modules.dart';

import '../modules/splashScreen/splash.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.ADDSENSOR;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.ADDSENSOR,
      page: () => const AddSensor(),
      binding: AddSensorBinding(),
    ),
    GetPage(
      name: Routes.ADDREGION,
      page: () => const AddRegion(),
      binding: AddRegionBinding(),
    ),
  ];
}
