import 'package:get/get.dart';
import 'package:seramcepte/modules/menuScreen/menu_screen_controller.dart';

class MenuScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuScreenController>(() => MenuScreenController());
  }
}
