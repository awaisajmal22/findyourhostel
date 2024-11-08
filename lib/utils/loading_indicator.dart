
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

loading({
  double size = 50,
  Color color =AppColor.darkblue,
}) {
  return SizedBox(
    height: size,
    width: size,
    child: LoadingIndicator(
      indicatorType: Indicator.ballScaleMultiple,
      colors: [
       color .withOpacity(0.5),
      color,
        color.withOpacity(0.5),
      ],
    ),
  );
}