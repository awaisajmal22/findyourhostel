import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';

toast({required String msg, required BuildContext context, int maxline = 2}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.black,
      content: appText(
        context: context,
        maxLine: maxline,
        title: msg,
        textColor: AppColor.offWhite,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      )));
}
