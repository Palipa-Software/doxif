import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/constants/custom_firebase_manager.dart';

class MenuScreenController extends GetxController {
  RxString userName = "".obs;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
}
