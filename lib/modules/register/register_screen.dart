import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/register/register_controller.dart';
import 'package:tutorai/shared/constants/constants.dart';
import 'package:tutorai/shared/constants/images.dart';
import 'package:tutorai/shared/widgets/main_button.dart';

import '../../shared/widgets/auth_custom_text_field.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Bounceable(onTap: () => Get.back(), child: Image.asset(ImagesPath.icBack))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            height: 85.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Yeni Hesap Oluştur",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Hesap oluştur ve devam et!",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.nameController,
                    hintText: "İsim",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validate: controller.validateName.value,
                    validateString: "İsim boş bırakılamaz",
                  ),
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.surnameController,
                    hintText: "Soyisim",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validate: controller.validateSurname.value,
                    validateString: "Soyisim boş bırakılamaz",
                  ),
                ),
                Obx(
                  () => TextField(
                      controller: controller.phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontFamily: "Rubik Regular"),
                      decoration: InputDecoration(
                          errorText: controller.validatePhone.value ? "Telefon boş bırakılamaz" : null,
                          label: const Text("+90 555 555 5555"),
                          labelStyle: const TextStyle(fontFamily: "Rubik Regular"),
                          hintStyle: const TextStyle(color: Color(0xFF172B4D), fontFamily: "Rubik Regular"),
                          prefixText: "+90 ",
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Image.asset(
                              "assets/images/ic_turkey.png",
                              width: 8.w,
                              height: 8.w,
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.sp))))),
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.emailController,
                    hintText: "E-Posta Adresi",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validate: controller.validateEmail.value,
                    validateString: "E-Posta boş bırakılamaz",
                  ),
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.passwordController,
                    hintText: "Şifre *",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    validate: controller.validatePassword.value,
                    validateString: "Şifre boş bırakılamaz",
                  ),
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.rePasswordController,
                    hintText: "Şifre Tekrar *",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validate: controller.validateRePassword.value,
                    validateString: "Şifre tekrar boş bırakılamaz",
                  ),
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: AppColors.appColor,
                        value: controller.checkBox.value,
                        onChanged: (value) {
                          controller.checkBox.value = value!;
                        },
                      ),
                      Bounceable(
                        onTap: () {
                          customAgreementPage(context, "Kullanıcı Sözleşmesi", controller.userAgreement);
                        },
                        child: Text(
                          "Kullanıcı sözleşmesi ",
                          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: AppColors.appColor),
                        ),
                      ),
                      Text(
                        "ve ",
                        style: TextStyle(fontSize: 9.sp),
                      ),
                      Bounceable(
                        onTap: () {
                          customAgreementPage(context, "Gizlilik Politikası", controller.privacyPolicy);
                        },
                        child: Text(
                          "Gizlilik Politikasını ",
                          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: AppColors.appColor),
                        ),
                      ),
                      Text(
                        "Kabul Ediyorum",
                        style: TextStyle(fontSize: 9.sp),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => SizedBox(
                      width: 100.w,
                      height: 6.h,
                      child: MainButton(
                        onPressed: () {
                          controller.textFieldValidate(controller.nameController, controller.validateName);
                          controller.textFieldValidate(controller.surnameController, controller.validateSurname);
                          controller.textFieldValidate(controller.phoneController, controller.validatePhone);
                          controller.textFieldValidate(controller.emailController, controller.validateEmail);
                          controller.textFieldValidate(controller.passwordController, controller.validatePassword);
                          controller.textFieldValidate(controller.rePasswordController, controller.validateRePassword);
                          controller.createUser(
                              controller.nameController.text,
                              controller.surnameController.text,
                              controller.phoneController.text,
                              controller.emailController.text,
                              controller.passwordController.text,
                              controller.rePasswordController.text);
                        },
                        child: controller.createUserControl.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Kayıt Ol",
                                style: TextStyle(fontFamily: "Rubik Regular", fontSize: 14.sp),
                              ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> customAgreementPage(BuildContext context, String title, String text) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.sp), topRight: Radius.circular(16.sp))),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 2.h),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
