import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/models/hostel_model/hostel_model.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

searchHostelTile(
    {required BuildContext context,
    required HostelAddModel model,
    bool isList = true,
    double? width}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.detail, arguments: model);
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width ?? context.getSize.width * 00.55,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [boxShadow(context: context)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(10),
            height: isList
                ? context.getSize.height * 0.25
                : context.getSize.height * 0.16,
            width:
                isList ? context.getSize.width : context.getSize.width * 0.55,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(model.images![0]), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20)),
            child: FittedBox(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.offWhite, shape: BoxShape.circle),
                  child: Icon(Icons.favorite_outline)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.heightBox(0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: appText(
                          maxLine: 1,
                          context: context,
                          title: model.name!,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.star, size: 15),
                    //     context.widthBox(0.004),
                    //     appText(
                    //       context: context,
                    //       title: model.review!,
                    //       fontSize: 12,
                    //     )
                    //   ],
                    // )
                  ],
                ),
                context.heightBox(0.005),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, size: 15),
                    context.widthBox(0.005),
                    Expanded(
                      child: appText(
                        maxLine: 2,
                        context: context,
                        title: model.location!,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                context.heightBox(0.02)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
