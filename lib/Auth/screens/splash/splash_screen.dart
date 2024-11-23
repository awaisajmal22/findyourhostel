import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/Auth/controller/splash_controller.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
final controller = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhite,
      body: Obx(() 
          => Opacity(
            opacity: controller.animationValue.value, // Use the animated opacity
            child: Center(
          child: Image.asset(AssetPaths.logo,)
        ),
      ),)
    );
  }
}