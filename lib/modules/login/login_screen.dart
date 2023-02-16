import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/login/login_controller.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:tutorai/routes/routes.dart';
import 'package:tutorai/shared/constants/constants.dart';
import 'package:tutorai/shared/constants/images.dart';

import '../../shared/widgets/auth_custom_text_field.dart';
import '../../shared/widgets/main_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SizedBox(
          width: 100.w,
          height: 90.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImagesPath.logo),
                Text(
                  AppStrings.loginTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  AppStrings.loginSubtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                LoginTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.eposta,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  color: const Color(0xFF7A869A),
                ),
                SizedBox(
                  height: 1.h,
                ),
                LoginTextField(
                  controller: controller.passwordController,
                  hintText: AppStrings.password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  color: const Color(0xFF7A869A),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgetPassword,
                          style: TextStyle(color: AppColors.appColor, decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                SizedBox(
                  width: 100.w,
                  height: 6.h,
                  child: MainButton(
                    onPressed: () {
                      controller.signIn(controller.emailController.text, controller.passwordController.text, context);
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(fontFamily: "Rubik Regular", fontSize: 14.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text(
                  AppStrings.or,
                  style: TextStyle(color: Color(0xFFA8AABC)),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  _SocialIconButton(
                      imagePath: ImagesPath.icGoogle,
                      onPressed: () {
                        controller.signInWithGoogle();
                      }),
                  _SocialIconButton(imagePath: ImagesPath.icApple, onPressed: () {})
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.notAccount,
                      style: TextStyle(color: Color(0xFF7a869a)),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(
                        AppStrings.createAccount,
                        style: TextStyle(color: AppColors.appColor),
                      ),
                    )
                  ],
                )
              ],
            ),
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
        child: Image.asset(imagePath),
      ),
    );
  }
}
