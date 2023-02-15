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
                TextField(
                    controller: controller.phoneController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontFamily: "Rubik Regular"),
                    decoration: InputDecoration(
                        label: const Text("+90 555 555 5555"),
                        labelStyle: const TextStyle(color: Color(0xFF172B4D), fontFamily: "Rubik Regular"),
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
                        onTap: () {},
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
                        onTap: () {},
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
}
