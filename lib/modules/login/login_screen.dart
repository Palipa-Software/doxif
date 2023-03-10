import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/modules/login/login_controller.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:seramcepte/routes/routes.dart';
import 'package:seramcepte/shared/constants/constants.dart';
import 'package:seramcepte/shared/constants/fonsts.dart';
import 'package:seramcepte/shared/constants/images.dart';

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
                Text(AppStrings.loginTitle, style: Theme.of(context).textTheme.headlineLarge),
                Text(AppStrings.loginSubtitle, style: Theme.of(context).textTheme.bodySmall),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => LoginTextField(
                      controller: controller.emailController,
                      hintText: AppStrings.eposta,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      color: AppColors.textFieldColor,
                      validate: controller.validateEmail.value,
                      validateString: AppStrings.errorEmptyMail),
                ),
                SizedBox(height: 1.h),
                Obx(() => LoginTextField(
                    controller: controller.passwordController,
                    hintText: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    color: AppColors.textFieldColor,
                    validate: controller.validatePassword.value,
                    validateString: AppStrings.errorEmptyPass)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _forgetPassword(context);
                        },
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
                      controller.textFieldValidate(controller.emailController, controller.validateEmail);
                      controller.textFieldValidate(controller.passwordController, controller.validatePassword);
                      controller.signIn(controller.emailController.text, controller.passwordController.text, context);
                    },
                    child: Text(AppStrings.login, style: TextStyle(fontFamily: AppFonts.regular, fontSize: 14.sp)),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text(AppStrings.or, style: TextStyle(color: Color(0xFFA8AABC))),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  _SocialIconButton(
                      imagePath: ImagesPath.icGoogle,
                      onPressed: () {
                        controller.signInWithGoogle(context);
                      })
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.notAccount, style: TextStyle(color: AppColors.textFieldColor)),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(AppStrings.createAccount, style: TextStyle(color: AppColors.appColor)),
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

  Future<void> _forgetPassword(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.sp), topRight: Radius.circular(16.sp))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: 58.h,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.w), child: Image.asset(ImagesPath.forgetPass)),
                    Text(
                      AppStrings.forgetPassword,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      AppStrings.postingEmailForgetPass,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Obx(
                      () => LoginTextField(
                        controller: controller.forgetPasswordController,
                        hintText: AppStrings.eposta,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validate: controller.validateForgetPassword.value,
                        validateString: AppStrings.errorEmptyMail,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 6.h,
                      child: MainButton(
                        onPressed: () {
                          controller.textFieldValidate(
                              controller.forgetPasswordController, controller.validateForgetPassword);
                          controller.resetPassword(controller.forgetPasswordController.text.toString().trim(), context);
                        },
                        child: const Text(AppStrings.newPass),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
