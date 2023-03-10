import 'package:get/get.dart';
import 'package:seramcepte/modules/homeDetailScreen/home_detail_controller.dart';

class HomeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDetailController>(() => HomeDetailController());
  }
}
