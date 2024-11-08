import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/seeker/controller/detail_controller.dart';
import 'package:findyourhostel/seeker/screens/detail/component/star_rating.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

reviewBottomSheet({
  required BuildContext context,
  required DetailController controller,
  required HostelAddModel model,
}) {
  showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Dialog(
          backgroundColor: AppColor.offWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  appText(
                      context: context,
                      title: 'Rating and Review',
                      fontWeight: FontWeight.bold),
                  context.heightBox(0.02),
                  StarRating(
                    rating: controller.rating,
                    onRatingChanged: (val) {
                      controller.changeRating(val);
                    },
                  ),
                  context.heightBox(0.02),
                  textField(
                      context: context,
                      controller: controller.comment,
                      hintText: 'Comment here..'),
                  context.heightBox(0.04),
                  if (!controller.isRaview)
                    Center(
                      child: loading(),
                    )
                  else
                    textButton(
                        context: context,
                        onTap: () async {
                          List<Review> reviewList = model.review!
                              .map((e) => Review.fromJson(e))
                              .toList();

                          controller.addReview(model.docId!, context);
                        },
                        title: 'Post Rating')
                ],
              ),
            ),
          ),
        );
      });
}
