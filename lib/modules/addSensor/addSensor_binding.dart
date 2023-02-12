import 'package:get/get.dart';

import 'addSensor_controller.dart';

class AddSensorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSensorController>(() => AddSensorController());
  }
}
