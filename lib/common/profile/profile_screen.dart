import 'dart:io';

import 'package:findyourhostel/common/controller/profile_conroller.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  bool isUserSide = Get.arguments;
  final controller = Get.find<ProfileConroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkblue,
        title: appText(
            context: context, title: 'Profile', textColor: AppColor.offWhite),
        actions: [
          GestureDetector(
            onTap: () {
              controller.logout();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 20),
              child: appText(
                  context: context,
                  title: 'Logout',
                  textColor: AppColor.offWhite,
                  fontSize: 15),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              context.heightBox(0.02),
              if (controller.image.contains('https'))
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [boxShadow(context: context)],
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColor.black.withOpacity(0.5))),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(controller.image),
                    ),
                  ),
                )
              else if (controller.image == '')
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [boxShadow(context: context)],
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColor.black.withOpacity(0.5))),
                    child: CircleAvatar(
                      backgroundColor: AppColor.offWhite,
                      radius: 60,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: AppColor.black.withOpacity(0.5),
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                )
              else
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [boxShadow(context: context)],
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColor.black.withOpacity(0.5))),
                    child: CircleAvatar(
                      backgroundColor: AppColor.offWhite,
                      radius: 60,
                      backgroundImage: FileImage(File(controller.image)),
                    ),
                  ),
                ),
              context.heightBox(0.05),
              textField(
                  context: context,
                  controller: controller.name,
                  hintText: 'Name'),
              context.heightBox(0.02),
              textField(
                  readOnly: true,
                  context: context,
                  controller: controller.email,
                  hintText: 'Email'),
              context.heightBox(0.02),
              textField(
                  context: context,
                  controller: controller.phone,
                  hintText: 'Phone Number'),
              context.heightBox(0.02),
              textField(
                  onTap: () {
                    controller.pickDateOfBirth(context: context);
                  },
                  readOnly: true,
                  context: context,
                  controller: controller.dob,
                  hintText: 'Date of birth'),
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
              context.heightBox(0.1),
              if (controller.loading)
                Center(
                  child: loading(),
                )
              else
                textButton(
                    context: context,
                    onTap: () {
                      controller.updateProfile(context: context);
                    },
                    title: 'Update'),
              context.heightBox(0.03),
            ],
          ),
        ),
      ),
    );
  }
}
