import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorai/shared/constants/constants.dart';

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
            Get.snackbar(AppStrings.successCreateAccount, AppStrings.successCreateAccountSubTitle,
                backgroundColor: AppColors.appColor.withOpacity(0.8));
            createUserControl.value = false;
            return user.user;
          } on FirebaseAuthException catch (e) {
            if (e.code.toString() == "invalid-email") {
              Get.snackbar(AppStrings.error, AppStrings.errorEmail,
                  backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            } else if (e.code.toString() == "weak-password") {
              Get.snackbar(AppStrings.error, AppStrings.errorWeakPassword,
                  backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            } else if (e.code.toString() == "email-already-in-use") {
              Get.snackbar(AppStrings.error, AppStrings.errorEmailInUse,
                  backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            } else {
              Get.snackbar(AppStrings.error, e.message.toString(),
                  backgroundColor: AppColors.appColor.withOpacity(0.8));
              createUserControl.value = false;
            }
          }
        } else {
          Get.snackbar(AppStrings.error, AppStrings.errorReCrypteWrong,
              backgroundColor: AppColors.appColor.withOpacity(0.8));
          createUserControl.value = false;
        }
      } else {
        Get.snackbar(AppStrings.error, AppStrings.errorEmpty, backgroundColor: AppColors.appColor.withOpacity(0.8));
        createUserControl.value = false;
      }
    } else {
      Get.snackbar(AppStrings.error, AppStrings.errorAgreementCheck,
          backgroundColor: AppColors.appColor.withOpacity(0.8));
      createUserControl.value = false;
    }
    createUserControl.value = false;
    return null;
  }
}
