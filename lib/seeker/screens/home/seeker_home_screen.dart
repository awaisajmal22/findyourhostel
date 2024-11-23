import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/common/controller/profile_conroller.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';

import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';

import 'package:findyourhostel/seeker/controller/home_controller.dart';

import 'package:findyourhostel/seeker/screens/home/component/filter_bottom_bar.dart';

import 'package:findyourhostel/seeker/screens/home/component/hostel_tile.dart';

import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/curom_app_bar.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SeekerHomeScreen extends StatelessWidget {
  SeekerHomeScreen({super.key});
  final controller = Get.put(SeekerHomeController());
  final pfCont = Get.put(ProfileConroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          customAppBar(context, pfCont),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              children: [
                context.heightBox(0.02),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.map,
                                );
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColor.offWhite,
                                  radius: 20,
                                  child: SvgPicture.asset(AssetPaths.map))),
                        ),
                        Expanded(
                          child: textField(
                              readOnly: true,
                              onTap: () {
                                Get.toNamed(AppRoutes.search);
                              },
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  filterBottomSheet(
                                      context: context, controller: controller);
                                },
                                child: const Icon(Ionicons.filter),
                              ),
                              context: context,
                              controller: TextEditingController(),
                              hintText: 'Search Hostel'),
                        ),
                        context.widthBox(0.02),
                        GestureDetector(
                            onTap: () {
                              controller.clearFilter();
                            },
                            child: SvgPicture.asset(
                              height: 50,
                              AssetPaths.clear,
                            ))
                      ],
                    )),
                // context.heightBox(0.02),
                // SingleChildScrollView(
                //   physics: const BouncingScrollPhysics(),
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       Column(
                //         children: [
                //           Container(
                //             margin: const EdgeInsets.symmetric(horizontal: 10),
                //             padding: const EdgeInsets.all(16),
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 border: Border.all(
                //                     color: AppColor.darkblue.withOpacity(0.5))),
                //             child: Icon(
                //               Icons.location_on,
                //               color: AppColor.darkblue,
                //             ),
                //           ),
                //           context.heightBox(0.001),
                //           appText(context: context, title: '', fontSize: 12)
                //         ],
                //       ),
                //       Row(
                //         children: List.generate(12, (index) {
                //           return Padding(
                //             padding: const EdgeInsets.only(right: 10),
                //             child: nearbyWidget(
                //                 context: context,
                //                 image: AssetPaths.networkImage,
                //                 city: 'Skardu'),
                //           );
                //         }),
                //       )
                //     ],
                //   ),
                // ),
                context.heightBox(0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: appText(
                      context: context,
                      title: controller.filterList.isEmpty
                          ? 'Popular Hostels'
                          : 'Filter Hostels',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                context.heightBox(0.005),
                if (controller.filterList.isNotEmpty)
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.filterList.length,
                      itemBuilder: (context, index) {
                        HostelAddModel model = controller.filterList[index];
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: hostelTile(
                                next: () {
                                  Get.toNamed(AppRoutes.detail,
                                      arguments: model);
                                },
                                width: context.getSize.width,
                                titleFont: 18,
                                height: context.getSize.height * 0.2,
                                context: context,
                                model: model,
                                onTap: () {
                                  controller.toggleFavoriteStatus(model);
                                }));
                      })
                else
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          controller.bookedHostel.length < 5
                              ? controller.bookedHostel.length
                              : 5, (index) {
                        HostelAddModel model = HostelAddModel.fromJson(
                            controller.bookedHostel[index].hostel_model!);
                        print("UOBS ${model.isActive}");
                        if (model.isActive == false) {
                          return const SizedBox.shrink();
                        } else {
                          return hostelTile(
                              isPopular: true,
                              next: () {
                                Get.toNamed(AppRoutes.detail, arguments: model);
                              },
                              context: context,
                              model: model,
                              onTap: () {
                                controller.toggleFavoriteStatus(model);
                              });
                        }
                      }),
                    ),
                  ),
                if (controller.filterList.isEmpty) context.heightBox(0.02),
                if (controller.filterList.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: appText(
                        context: context,
                        title: 'Other Hostels',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (controller.filterList.isEmpty) context.heightBox(0.02),
                if (controller.filterList.isEmpty)
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.hostelsList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: context.getSize.height * 0.26,
                          mainAxisSpacing: 15,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        HostelAddModel model = controller.hostelsList[index];
                        print("Hostel Length ${controller.hostelsList.length}");
                        return hostelTile(
                            next: () {
                              Get.toNamed(AppRoutes.detail, arguments: model);
                            },
                            onTap: () {
                              controller.toggleFavoriteStatus(model);
                            },
                            context: context,
                            width: double.infinity,
                            model: model);
                      }),
                context.heightBox(0.05)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
