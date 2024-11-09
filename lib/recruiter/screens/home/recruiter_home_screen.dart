import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/common/controller/profile_conroller.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/recruiter/controller/recruiter_dashboard_controller.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/curom_app_bar.dart';

class RecruiterHomeScreen extends StatelessWidget {
  RecruiterHomeScreen({super.key});
  final controller = Get.find<RecruiterDashBoardController>();
  final pfCont = Get.find<ProfileConroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.darkblue,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addhostel);
          },
          child: Icon(Icons.add),
        ),
        appBar: customAppBar(context, pfCont),
        body: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.hostelsList.length,
              itemBuilder: (context, index) {
                HostelAddModel model = controller.hostelsList[index];
                return Container(
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColor.darkblue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        boxShadow(context: context, color: AppColor.offWhite)
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.getSize.height * 0.25,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PageView.builder(
                                controller: controller.pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: model.images!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: context.getSize.height * 0.25,
                                    width: context.getSize.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              model.images![index]),
                                          fit: BoxFit.cover),
                                    ),
                                  );
                                }),
                            Positioned(
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: AppColor.black.withOpacity(0.4),
                                    shape: BoxShape.circle),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeIndex();
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: AppColor.black.withOpacity(0.4),
                                    shape: BoxShape.circle),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeIndex(isLeft: true);
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      context.heightBox(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText(
                              fontSize: 18,
                              context: context,
                              maxLine: 2,
                              title: model.name!),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              context.widthBox(0.01),
                              Container(
                                width: context.getSize.width * 0.44,
                                child: appText(
                                    fontSize: 15,
                                    context: context,
                                    maxLine: 2,
                                    title: model.location!),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 7,
                            runSpacing: 7,
                            children:
                                List.generate(model.roomType!.length, (index) {
                              final rooms =
                                  RoomType.fromJson(model.roomType![index]);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText(
                                      textAlign: TextAlign.left,
                                      fontSize: 15,
                                      context: context,
                                      title: controller.roomTypes[rooms.type!]),
                                  appText(
                                      textAlign: TextAlign.left,
                                      context: context,
                                      title: 'Price: Rs ${rooms.price}',
                                      fontSize: 15)
                                ],
                              );
                            }),
                          )
                        ],
                      ),
                      context.heightBox(0.02),
                      Row(
                        children: [
                          Expanded(
                            child: textButton(
                                textColor: AppColor.darkblue,
                                borderColor: Colors.green.shade100,
                                bgColor: Colors.green.shade100,
                                context: context,
                                onTap: () {
                                  Get.toNamed(AppRoutes.editHostel,
                                      arguments: model);
                                },
                                title: 'Edit'),
                          ),
                          context.widthBox(0.02),
                          Expanded(
                            child: textButton(
                                textColor: AppColor.darkblue,
                                borderColor: Colors.redAccent.shade100,
                                bgColor: Colors.redAccent.shade100,
                                context: context,
                                onTap: () {
                                  controller.deleteHostel(model.docId!);
                                },
                                title: 'Delete'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
