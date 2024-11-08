import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/font_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


appText(
    {required BuildContext context,
    required String title,
    FontWeight fontWeight = FontWeight.w500,
    Color textColor = AppColor.black,
    double fontSize = 20,
    TextAlign? textAlign,
    int? maxLine}) {
  return Text(
    title,
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        fontSize: context.fontSize(fontSize),
        color: textColor),
  );
}