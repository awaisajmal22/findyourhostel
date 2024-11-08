import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/seeker/controller/home_controller.dart';
import 'package:findyourhostel/seeker/controller/seeker_search_controller.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

filterBottomSheet(
    {required BuildContext context, required SeekerHomeController controller}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      barrierColor: AppColor.darkblue.withOpacity(0.3),
      context: context,
      builder: (context) {
        return Obx(
          () => Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: AppColor.offWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: context.getSize.height * 0.65,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      boxShadow: [
                        boxShadow(context: context, color: AppColor.offWhite)
                      ],
                      color: AppColor.darkblue,
                      borderRadius: BorderRadius.circular(20)),
                  child: appText(
                      context: context,
                      title: 'Set Your Filter',
                      textColor: AppColor.offWhite,
                      fontWeight: FontWeight.bold),
                ),
                context.heightBox(0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: appText(
                      context: context,
                      title: 'Gender',
                      fontWeight: FontWeight.bold),
                ),
                context.heightBox(0.01),
                Row(
                  children: List.generate(controller.gender.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectGender(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: controller.selectedGender == index
                                ? AppColor.darkblue
                                : AppColor.offWhite),
                        child: appText(
                            context: context,
                            title: controller.gender[index],
                            fontSize: 14,
                            textColor: controller.selectedGender == index
                                ? AppColor.offWhite
                                : AppColor.black),
                      ),
                    );
                  }),
                ),
                context.heightBox(0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: appText(
                      context: context,
                      title: 'Room Type',
                      fontWeight: FontWeight.bold),
                ),
                context.heightBox(0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 10,
                    spacing: 10,
                    children:
                        List.generate(controller.roomTypes.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectRoomType(index);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: controller.selectedRoomType.contains(index)
                                  ? AppColor.darkblue
                                  : AppColor.offWhite),
                          child: appText(
                              context: context,
                              title: controller.roomTypes[index],
                              fontSize: 14,
                              textColor:
                                  controller.selectedRoomType.contains(index)
                                      ? AppColor.offWhite
                                      : AppColor.black),
                        ),
                      );
                    }),
                  ),
                ),
                context.heightBox(0.01),
                Align(
                  alignment: Alignment.centerLeft,
                  child: appText(
                      context: context,
                      title: 'Price Range',
                      fontWeight: FontWeight.bold),
                ),
                context.heightBox(0.01),
                RangeSlider(
                    max: 50000,
                    min: 500,
                    divisions: (50000 - 500) ~/ 100,
                    labels: RangeLabels(
                      controller.rangeValue.start.round().toString(),
                      controller.rangeValue.end.round().toString(),
                    ),
                    values: controller.rangeValue,
                    onChanged: (val) {
                      controller.changeRange(val);
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(
                        context: context,
                        title: '500 Rs',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    appText(
                        context: context,
                        title: '50000 Rs',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                context.heightBox(0.02),
                textButton(
                    context: context,
                    onTap: () {
                      controller.filterHostels(
                          controller.hostelsList,
                          controller.rangeValue.start,
                          controller.rangeValue.end,
                          controller.selectedRoomType,
                          controller.selectedGender);
                      Get.back();
                    },
                    title: 'Save')
              ],
            ),
          ),
        );
      });
}
