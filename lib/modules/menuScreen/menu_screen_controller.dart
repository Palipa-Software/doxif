import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MenuScreenController extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;
  Future<void> deleteUser() async {
    await user.delete();
  }
}
