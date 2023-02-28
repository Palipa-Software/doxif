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
  RxBool validateName = false.obs;
  RxBool validateSurname = false.obs;
  RxBool validatePhone = false.obs;
  RxBool validateEmail = false.obs;
  RxBool validatePassword = false.obs;
  RxBool validateRePassword = false.obs;
  String userAgreement =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String privacyPolicy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  void textFieldValidate(TextEditingController controller, RxBool validate) {
    controller.text.isEmpty ? validate.value = true : validate.value = false;
  }

  RxBool createUserControl = false.obs;
  RxBool checkBox = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> createUser(
      String name, String surname, String phone, String email, String password, String rePassword) async {
    createUserControl.value = true;
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
            Get.snackbar("Kayıt Başarılı", "Başarılı bir biçimde kayıt oldunuz. Giriş .Yapınız",
                backgroundColor: AppColors.appColor.withOpacity(0.8));
            createUserControl.value = false;
            return user.user;
          } on FirebaseAuthException catch (e) {
            if (e.code.toString() == "invalid-email") {
              Get.snackbar("Hata", "Geçersiz E-Posta", backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            } else if (e.code.toString() == "weak-password") {
              Get.snackbar("Hata", "Güçsüz Parola", backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            } else if (e.code.toString() == "email-already-in-use") {
              Get.snackbar("Hata", "E-Mail Kullanılıyor", backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            } else {
              Get.snackbar("Error", e.message.toString(), backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            }
          }
        } else {
          Get.snackbar("Hata", "Şifre uyuşmuyor", backgroundColor: AppColors.appColor.withOpacity(0.8));
          createUserControl.value = false;
        }
      } else {
        Get.snackbar("Hata", "Hiçbir alan boş bırakılamaz.", backgroundColor: AppColors.appColor.withOpacity(0.8));
        createUserControl.value = false;
      }
    } else {
      Get.snackbar("Hata", "Lütfen kullanıcı sözleşmesi ve Gizlilik Politikasını Kabul Edin",
          backgroundColor: AppColors.appColor.withOpacity(0.8));
      createUserControl.value = false;
    }
    createUserControl.value = false;
    return null;
  }
}
