import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:flutter/material.dart';

Widget expandedTile(
    {required BuildContext context,
    required List<String> dataList,
    required Function(String) onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
    decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [
          boxShadow(
            context: context,
            blur: 15,
            color: Colors.black,
            opacity: 0.3,
          ),
        ],
        borderRadius: BorderRadius.circular(20)),
    child: AnimatedList(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        initialItemCount: dataList.length,
        itemBuilder: (context, index, animation) {
          return GestureDetector(
            onTap: () {
              onTap(dataList[index]);
            },
            child: SizeTransition(
              sizeFactor: animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0 ? SizedBox.shrink() : context.heightBox(0.01),
                  appText(
                    context: context,
                    title: dataList[index],
                    textColor: AppColor.black.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  dataList.length - 1 == index
                      ? SizedBox.shrink()
                      : context.heightBox(0.01),
                  dataList.length - 1 == index
                      ? SizedBox.shrink()
                      : Container(
                          height: 1,
                          color: AppColor.black.withOpacity(0.4),
                          width: context.getSize.width,
                        )
                ],
              ),
            ),
          );
        }),
  );
}

Widget expandedTile2(
    {required BuildContext context,
    required List<String> dataList,
    required Function(int,String) onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
    decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [
          boxShadow(
            context: context,
            blur: 15,
            color: Colors.black,
            opacity: 0.3,
          ),
        ],
        borderRadius: BorderRadius.circular(20)),
    child: AnimatedList(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        initialItemCount: dataList.length,
        itemBuilder: (context, index, animation) {
          if (dataList[index] == '') {
            return SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () {
              onTap(index, dataList[index]);
            },
            child: SizeTransition(
              sizeFactor: animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0 ? SizedBox.shrink() : context.heightBox(0.01),
                  appText(
                    context: context,
                    title: dataList[index],
                    textColor: AppColor.black.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  dataList.length - 1 == index
                      ? SizedBox.shrink()
                      : context.heightBox(0.01),
                  dataList.length - 1 == index
                      ? SizedBox.shrink()
                      : Container(
                          height: 1,
                          color: AppColor.black.withOpacity(0.4),
                          width: context.getSize.width,
                        )
                ],
              ),
            ),
          );
        }),
  );
}
