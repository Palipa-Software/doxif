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
      Get.snackbar("Şifremi Unuttum", "E-posta adresine bir link gönderdik. Lütfen kontrol ediniz.",
          backgroundColor: AppColors.appColor.withOpacity(0.8));
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        Get.snackbar("Hata", "E-posta boş bırakılmaz", backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "invalid-email") {
        Get.snackbar("Hata", "Yanlış e-posta formatı", backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "user-not-found") {
        Get.snackbar("Hata", "Böyle bir kullanıcı yok lütfen e-posta adresini kontrol ediniz.",
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "network-request-failed") {
        Get.snackbar("Hata", "İnternet bağlantınızı kontrol ediniz. Bir sorun oluştu.",
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else {
        Get.snackbar("Error", e.message.toString(), backgroundColor: AppColors.appColor.withOpacity(0.8));
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
      Get.snackbar("Error", e.message.toString());
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
        Get.snackbar("Hata", "E-Posta ve şifre alanları boş geçilemez.",
            backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "invalid-email") {
        Get.snackbar("Hata", "Geçersiz E-Posta", backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "user-not-found") {
        Get.snackbar("Hata", "Geçersiz e-posta veya şifre", backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else if (e.code == "wrong-password") {
        Get.snackbar("Hata", "Hatalı e-posta veya şifre", backgroundColor: AppColors.appColor.withOpacity(0.8));
      } else {
        Get.snackbar("Hata", e.message.toString(), backgroundColor: AppColors.appColor.withOpacity(0.8));
      }
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
