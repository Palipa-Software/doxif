import 'package:get/get.dart';

import 'addRegion_controller.dart';

class AddRegionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRegionController>(() => AddRegionController());
  }
}
