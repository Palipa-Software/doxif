// ignore_for_file: file_names

import 'package:get/get.dart';

import 'addRegion_controller.dart';

class AddRegionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRegionController>(() => AddRegionController());
  }
}
