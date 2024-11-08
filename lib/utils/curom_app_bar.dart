
  import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/common/controller/profile_conroller.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(BuildContext context,ProfileConroller pfCont) {
    return AppBar(
        backgroundColor: AppColor.darkblue,
        title: appText(
            context: context,
            title: 'Dashbaord',
            textColor: AppColor.offWhite),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.profile, arguments: false);
              },
              child: pfCont.image == ''
                  ? const CircleAvatar(
                      backgroundColor: AppColor.offWhite,
                      radius: 20,
                      child: Icon(Icons.person),
                    )
                  : CircleAvatar(
                      backgroundColor: AppColor.offWhite,
                      radius: 20,
                      backgroundImage: NetworkImage(pfCont.image),
                    ),
            ),
          )
        ],
      );
  }