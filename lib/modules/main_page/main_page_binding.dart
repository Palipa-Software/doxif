import 'package:get/get.dart';
import 'package:tutorai/modules/main_page/main_page_controller.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}
