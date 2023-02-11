import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/login/login_controller.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:tutorai/shared/constants/constants.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo.png"),
              Text(
                "Tekrar Hoşgeldin",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Merhaba, devam etmek için oturum açınız",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "E-Posta",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.sp),
                      ),
                    ),
                  )),
              TextField(
                controller: passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Şifremi Unuttum",
                        style: TextStyle(color: AppColors.appColor, decoration: TextDecoration.underline),
                      )),
                ],
              ),
              SizedBox(
                width: 100.w,
                height: 6.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
                    backgroundColor: AppColors.appColor,
                  ),
                  onPressed: () {},
                  child: const Text("Giriş Yap"),
                ),
              ),
              const Text(
                "Ya da",
                style: TextStyle(color: Color(0xFFA8AABC)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                _SocialIconButton(imagePath: "ic_google", onPressed: () {}),
                _SocialIconButton(imagePath: "ic_apple", onPressed: () {})
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hesabın Yok Mu ?",
                    style: TextStyle(color: Color(0xFF7a869a)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(color: AppColors.appColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({required this.imagePath, required this.onPressed});
  final String imagePath;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp), border: Border.all(color: const Color(0xFFF1F1F1))),
        child: Image.asset("assets/images/$imagePath.png"),
      ),
    );
  }
}
