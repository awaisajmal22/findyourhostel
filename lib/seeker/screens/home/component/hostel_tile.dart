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
import 'package:shimmer/shimmer.dart';

hostelTile(
    {required BuildContext context,
    required HostelAddModel model,
    required VoidCallback onTap,
    bool isPopular = false,
    double titleFont = 15,
    double? height,
    required VoidCallback next,
    double? width}) {
  return GestureDetector(
    onTap: next,
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
          if (model.images == [])
            Shimmer.fromColors(
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(10),
                  height: context.getSize.height * 0.16,
                  width: width ?? context.getSize.width * 0.55,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
                baseColor: AppColor.darkblue.withOpacity(0.4),
                highlightColor: AppColor.darkblue.withOpacity(0.4))
          else
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(10),
              height: height ?? context.getSize.height * 0.16,
              width: width ?? context.getSize.width * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(model.images![0]), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20)),
              child: isPopular
                  ? null
                  : GestureDetector(
                      onTap: onTap,
                      child: FittedBox(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.offWhite,
                                shape: BoxShape.circle),
                            child: Icon(
                              model.favorite!
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: model.favorite!
                                  ? Colors.red.shade900
                                  : AppColor.darkblue,
                            )),
                      ),
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
                          fontSize: titleFont,
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
                        maxLine: 1,
                        context: context,
                        title: model.location!,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                context.heightBox(0.005),
                // appText(
                //     context: context,
                //     title: '${model.price} PKR',
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold),
                context.heightBox(0.02)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
