import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/font_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

richText(
    {required String title,
    required String subtitle,
    required BuildContext context}) {
  return RichText(
      text: TextSpan(
          text: '$title : ',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              fontSize: context.fontSize(15),
              color: AppColor.black),
          children: [
        TextSpan(
          text: subtitle,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              fontSize: context.fontSize(15),
              color: AppColor.black),
        )
      ]));
}
