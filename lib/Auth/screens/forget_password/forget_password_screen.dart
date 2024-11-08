import 'package:findyourhostel/Auth/controller/forget_password_controller.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final controller = Get.find<ForgetPasswordController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText(
          context: context,
          title: 'Forget Password',
          textColor: AppColor.offWhite,
        ),
      ),
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                context.heightBox(0.1),
                Image.asset(
                  AssetPaths.logo,
                  width: context.getSize.width * 0.4,
                ),
                context.heightBox(0.05),
                appText(
                    textAlign: TextAlign.left,
                    context: context,
                    maxLine: 3,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    title:
                        'Please fill out your email below\nin order to recieve a reset\npassword link.'),
                context.heightBox(0.05),
                textField(
                    context: context,
                    controller: controller.email,
                    hintText: 'Email'),
                context.heightBox(0.1),
                if (controller.loading)
                  Center(child: loading())
                else
                  textButton(
                      context: context,
                      onTap: () {
                        controller.sendPasswordResetEmail(
                            controller.email.text, context);
                      },
                      title: 'Send')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
