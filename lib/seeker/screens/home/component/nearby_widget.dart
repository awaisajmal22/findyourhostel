import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';

nearbyWidget(
    {required BuildContext context,
    double radius = 30,
    required String image,
    required String city}) {
  return Column(
    children: [
      CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(image),
      ),
      context.heightBox(0.001),
      appText(context: context, title: city, fontSize: 12)
    ],
  );
}
