// ignore_for_file: file_names

import 'package:get/get.dart';

import 'editRegion_controller.dart';

class EditRegionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRegionController>(() => EditRegionController());
  }
}
