import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/Auth/controller/signup_controller.dart';
import 'package:findyourhostel/extensions/font_size_extension.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/extensions/validation_extension.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/expanded_tile.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => Column(
            children: [
              context.heightBox(0.1),
              Image.asset(
                AssetPaths.logo,
                width: context.getSize.width * 0.4,
              ),
              context.heightBox(0.05),
              textField(
                  context: context,
                  controller: controller.email,
                  hintText: 'Email'),
              context.heightBox(0.02),
              textField(
                  isObscure: controller.obsecure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.toggleObsecure();
                    },
                    child: Icon(
                      controller.obsecure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.black.withOpacity(0.5),
                    ),
                  ),
                  context: context,
                  controller: controller.password,
                  hintText: 'Password'),
              context.heightBox(0.02),
              textField(
                  isObscure: controller.obsecure2,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.toggleObsecure2();
                    },
                    child: Icon(
                      controller.obsecure2
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.black.withOpacity(0.5),
                    ),
                  ),
                  context: context,
                  controller: controller.confirmPassword,
                  hintText: 'Confirm Password'),
              context.heightBox(0.02),
              textField(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.toggleShowRole();
                    },
                    child: Icon(
                      controller.isShowRole
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColor.black.withOpacity(0.5),
                    ),
                  ),
                  onTap: () {
                    controller.toggleShowRole();
                  },
                  readOnly: true,
                  context: context,
                  controller: controller.role,
                  hintText: 'Role'),
              if (controller.isShowRole) context.heightBox(0.02),
              if (controller.isShowRole)
                expandedTile(
                    context: context,
                    dataList: controller.roles,
                    onTap: (val) {
                      controller.role.text = val;
                      controller.toggleShowRole();
                    }),
                  context.heightBox(0.02),
                    Row(
                  children: List.generate(controller.gender.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectGender(index);
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.black),
                                  shape: BoxShape.circle),
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.selectedGender == index
                                        ? AppColor.black
                                        : AppColor.offWhite),
                              ),
                            ),
                            context.widthBox(0.01),
                            appText(
                                context: context,
                                title: controller.gender[index],
                                fontSize: 15),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              context.heightBox(0.05),
              if (controller.loading)
                loading()
              else
                textButton(
                  context: context,
                  onTap: () {
                    if (!controller.email.text.emailValidator()) {
                      toast(
                          msg: 'Please enter valid email address.',
                          context: context);
                    } else if (controller.password.text.isEmpty) {
                      toast(
                          msg: "please enter your password.", context: context);
                    } else if (controller.password.text.length < 6) {
                      toast(
                          msg: 'Password must be 6 digits or greater.',
                          context: context);
                    } else if (controller.password.text !=
                        controller.confirmPassword.text) {
                      toast(
                          msg: 'Confirm password not match.', context: context);
                    } else if (controller.role.text.isEmpty) {
                      toast(msg: 'Please select your role.', context: context);
                    } else {
                      controller.signup(context: context);
                    }
                  },
                  title: 'SIGNUP',
                ),
              context.heightBox(0.1),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: context.fontSize(16),
                        fontWeight: FontWeight.w400,
                        color: AppColor.black.withOpacity(0.5),
                      ),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offNamed(
                              AppRoutes.login,
                            );
                          },
                        text: 'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: context.fontSize(16),
                          fontWeight: FontWeight.w700,
                          color: AppColor.darkblue,
                        ))
                  ])),
            ],
          ),
        ),
      )),
    );
  }
}
