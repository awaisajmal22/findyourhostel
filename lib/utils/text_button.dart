import 'dart:io';

import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';


textButton({
  required BuildContext context,
  required VoidCallback onTap,
  required String title,
  Color textColor = AppColor.offWhite,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w600,
   double radius =20,
  Color bgColor = AppColor.darkblue,
  Color borderColor = AppColor.black,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: appText(
          context: context,
          title: title,
          fontSize: fontSize,
          fontWeight: fontWeight,
          textColor: textColor),
    ),
  );
}