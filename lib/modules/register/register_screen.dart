import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/modules/register/register_controller.dart';
import 'package:tutorai/modules/register/user_agreement_page.dart';
import 'package:tutorai/shared/constants/constants.dart';
import 'package:tutorai/shared/constants/fonsts.dart';
import 'package:tutorai/shared/constants/images.dart';
import 'package:tutorai/shared/widgets/main_button.dart';

import '../../shared/widgets/auth_custom_text_field.dart';
import 'kvkk_page.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Bounceable(onTap: () => Get.back(), child: Image.asset(ImagesPath.icBack))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SizedBox(
          width: 100.w,
          height: 85.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.registerTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  AppStrings.registerSubTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.nameController,
                    hintText: AppStrings.name,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validate: controller.validateName.value,
                    validateString: AppStrings.nameError,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.surnameController,
                    hintText: AppStrings.surName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validate: controller.validateSurname.value,
                    validateString: AppStrings.surnameError,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => TextField(
                      controller: controller.phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontFamily: AppFonts.regular),
                      decoration: InputDecoration(
                          errorText: controller.validatePhone.value ? AppStrings.phoneError : null,
                          label: const Text("${AppStrings.phoneCode} ${AppStrings.phone}"),
                          labelStyle: const TextStyle(fontFamily: AppFonts.regular),
                          hintStyle: TextStyle(color: AppColors.addPhoto, fontFamily: AppFonts.regular),
                          prefixText: AppStrings.phoneCode,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Image.asset(
                              ImagesPath.phoneCountryCode,
                              width: 8.w,
                              height: 8.w,
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.sp))))),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.emailController,
                    hintText: AppStrings.epostaAddress,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validate: controller.validateEmail.value,
                    validateString: AppStrings.errorEmptyMail,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.passwordController,
                    hintText: AppStrings.crypte,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    validate: controller.validatePassword.value,
                    validateString: AppStrings.errorEmptyPass,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => LoginTextField(
                    controller: controller.rePasswordController,
                    hintText: AppStrings.reCrypte,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validate: controller.validateRePassword.value,
                    validateString: AppStrings.errorReCrypt,
                  ),
                ),
                SizedBox(
                  height: 2.h,
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Bounceable(
                        onTap: () {
                          AgreementPage(context, const UserAgreement());
                        },
                        child: Text(
                          "${AppStrings.userAgreement} ",
                          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: AppColors.appColor),
                        ),
                      ),
                      Text(
                        "${AppStrings.and} ",
                        style: TextStyle(fontSize: 9.sp),
                      ),
                      Bounceable(
                        onTap: () {
                          AgreementPage(context, const KvkkPage());
                        },
                        child: Text(
                          "${AppStrings.kvkk} ",
                          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: AppColors.appColor),
                        ),
                      ),
                      Text(
                        AppStrings.confirm,
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
                            ? CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : Text(
                                AppStrings.createAccount,
                                style: TextStyle(fontFamily: AppFonts.regular, fontSize: 14.sp),
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

  Future<dynamic> AgreementPage(BuildContext context, Widget page) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.sp), topRight: Radius.circular(16.sp))),
      context: context,
      builder: (BuildContext context) {
        return page;
      },
    );
  }
}
