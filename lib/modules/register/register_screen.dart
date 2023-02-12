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
                LoginTextField(
                  controller: controller.nameController,
                  hintText: "İsim",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                LoginTextField(
                  controller: controller.surnameController,
                  hintText: "Soyisim",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                LoginTextField(
                  controller: controller.phoneController,
                  hintText: "İsim",
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                LoginTextField(
                  controller: controller.emailController,
                  hintText: "E-Posta Adresi",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                LoginTextField(
                  controller: controller.passwordController,
                  hintText: "Şifre *",
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                ),
                LoginTextField(
                  controller: controller.rePasswordController,
                  hintText: "Şifre Tekrar *",
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.appColor,
                        value: controller.checkBox.value,
                        onChanged: (value) {
                          controller.checkBox.value = value!;
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: 100.w,
                    height: 6.h,
                    child: MainButton(
                        onPressed: () {
                          controller.createUser(
                              controller.nameController.text,
                              controller.surnameController.text,
                              controller.phoneController.text,
                              controller.emailController.text,
                              controller.passwordController.text,
                              controller.rePasswordController.text);
                        },
                        title: "Kayıt Ol"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
