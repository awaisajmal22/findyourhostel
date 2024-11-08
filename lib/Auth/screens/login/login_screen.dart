import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/Auth/controller/login_controller.dart';
import 'package:findyourhostel/extensions/font_size_extension.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/extensions/validation_extension.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.find<LoginController>();

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
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.forgetpassword);
                  },
                  child: appText(
                      context: context,
                      title: 'Forget Password?',
                      fontSize: 12),
                ),
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
                    } else {
                      controller.login(context: context);
                    }
                  },
                  title: 'LOGIN',
                ),
              context.heightBox(0.1),
              RichText(
                  text: TextSpan(
                      text: 'Don’t have an account? ',
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
                            Get.toNamed(
                              AppRoutes.signup,
                            );
                          },
                        text: 'Sign Up',
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
