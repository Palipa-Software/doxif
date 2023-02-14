import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorai/shared/constants/colors.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RxBool checkBox = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> createUser(
      String name, String surname, String phone, String email, String password, String rePassword) async {
    if (checkBox.value == true) {
      if (password.isNotEmpty && name.isNotEmpty && surname.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        if (password == rePassword) {
          try {
            var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            await _firestore.collection("users").doc(user.user?.uid).set({
              "name": name,
              "surname": surname,
              "phone": phone,
              "email": email,
            });
            return user.user;
          } on FirebaseAuthException catch (e) {
            if (e.code.toString() == "invalid-email") {
              Get.snackbar("Hata", "Geçersiz E-Posta", backgroundColor: AppColors.appColor.withOpacity(0.5));
            } else if (e.code.toString() == "weak-password") {
              Get.snackbar("Hata", "Güçsüz Parola", backgroundColor: AppColors.appColor.withOpacity(0.5));
            } else if (e.code.toString() == "email-already-in-use") {
              Get.snackbar("Hata", "E-Mail Kullanılıyor", backgroundColor: AppColors.appColor.withOpacity(0.5));
            } else {
              Get.snackbar("Error", e.message.toString(), backgroundColor: AppColors.appColor.withOpacity(0.5));
            }
          }
        } else {
          Get.snackbar("Hata", "Şifre uyuşmuyor", backgroundColor: AppColors.appColor.withOpacity(0.5));
        }
      } else {
        Get.snackbar("Hata", "Hiçbir alan boş bırakılamaz.", backgroundColor: AppColors.appColor.withOpacity(0.5));
      }
    } else {
      Get.snackbar("Hata", "Lütfen kullanıcı sözleşmesi ve Gizlilik Politikasını Kabul Edin",
          backgroundColor: AppColors.appColor.withOpacity(0.5));
    }
    return null;
  }
}
