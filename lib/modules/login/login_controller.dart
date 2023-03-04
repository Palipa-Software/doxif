import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorai/routes/routes.dart';
import 'package:tutorai/shared/constants/constants.dart';

class LoginController extends GetxController {
  //Textfieldların controllerları
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordController = TextEditingController();

  //Firebase işlemleri için instance'lar
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //Textfield'ların empty kontrolü
  RxBool validateEmail = false.obs;
  RxBool validatePassword = false.obs;
  RxBool validateForgetPassword = false.obs;
  //Textfield kontrol işlemi
  void textFieldValidate(TextEditingController controller, RxBool validate) {
    controller.text.isEmpty ? validate.value = true : validate.value = false;
  }

  //Şifre yenileme fonksiyonu
  Future resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      Get.snackbar(AppStrings.forgetPassword, AppStrings.postForgetPassMail,
          backgroundColor: AppColors.appColor.withOpacity(0.8));
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        Get.snackbar(AppStrings.error, AppStrings.errorEmptyMail, backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "invalid-email") {
        Get.snackbar(AppStrings.error, AppStrings.errorBadlyFormat,
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "user-not-found") {
        Get.snackbar(AppStrings.error, AppStrings.errorEmptyUser, backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "network-request-failed") {
        Get.snackbar(AppStrings.error, AppStrings.errorConnetion, backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else {
        Get.snackbar(AppStrings.error, e.message.toString(), backgroundColor: AppColors.appColor.withOpacity(0.8));
      }
    }
  }

//Google ile giriş fonksiyonu
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      var user = await FirebaseAuth.instance.signInWithCredential(credential);
      await _firestore.collection("users").doc(user.user?.uid).set({
        "name": googleUser.displayName,
        "surname": "",
        "phone": "",
        "email": googleUser.email,
      });
      return user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(AppStrings.error, e.message.toString());
    }
    return null;
  }

//E-posta şifre ile giriş fonksiyonu
  Future signIn(String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
          child: CircularProgressIndicator(
        color: AppColors.appColor,
      )),
    );
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      Get.offAllNamed(Routes.MAINPAGE);
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        Get.snackbar(AppStrings.error, AppStrings.errorEmptyText, backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "invalid-email") {
        Get.snackbar(AppStrings.error, AppStrings.errorBadlyFormat,
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "user-not-found") {
        Get.snackbar(AppStrings.error, AppStrings.errorInvalidCredential,
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "wrong-password") {
        Get.snackbar(AppStrings.error, AppStrings.errorFailPassAndMail,
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else {
        Get.snackbar(AppStrings.error, e.message.toString(), backgroundColor: AppColors.appColor.withOpacity(0.8));
      }
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
