import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorai/routes/routes.dart';
import 'package:tutorai/shared/constants/constants.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
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
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.offAllNamed(Routes.MAINPAGE);
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        Get.snackbar("Hata", "E-Posta ve şifre alanları boş geçilemez.",
            backgroundColor: AppColors.appColor.withOpacity(0.5));
      } else if (e.code == "invalid-email") {
        Get.snackbar("Hata", "Geçersiz E-Posta",
            backgroundColor: AppColors.appColor.withOpacity(0.5));
      } else if (e.code == "user-not-found") {
        Get.snackbar("Hata", "Geçersiz e-posta veya şifre",
            backgroundColor: AppColors.appColor.withOpacity(0.5));
      } else if (e.code == "wrong-password") {
        Get.snackbar("Hata", "Hatalı e-posta veya şifre",
            backgroundColor: AppColors.appColor.withOpacity(0.5));
      } else {
        Get.snackbar("Hata", e.message.toString(),
            backgroundColor: AppColors.appColor.withOpacity(0.5));
      }
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
