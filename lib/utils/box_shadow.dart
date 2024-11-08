import 'package:findyourhostel/constant/app_colors.dart';
import 'package:flutter/material.dart';


boxShadow({required BuildContext context,Color color = AppColor.black,double blur = 22, double spread =0, double x =0, double y =0, double opacity = 0.2,}){
  return BoxShadow(
    blurRadius: blur,
    spreadRadius: spread,
    offset: Offset(x, y),
    color: color.withOpacity(opacity)
  );
}