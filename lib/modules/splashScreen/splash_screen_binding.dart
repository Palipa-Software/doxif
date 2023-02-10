import 'package:get/get.dart';
import 'package:tutorai/modules/splashScreen/splash.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}
