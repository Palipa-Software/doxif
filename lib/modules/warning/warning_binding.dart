import 'package:get/get.dart';
import 'package:tutorai/modules/warning/warning.dart';

class WarningBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarningController>(() => WarningController());
  }
}
