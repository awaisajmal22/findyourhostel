import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/seeker/controller/wish_list_controller.dart';
import 'package:findyourhostel/seeker/screens/home/component/hostel_tile.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  final controller = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          AppBar(
            backgroundColor: AppColor.darkblue,
            title: appText(
              context: context,
              title: 'Favorite',
              textColor: AppColor.offWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.hostelsList.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  HostelAddModel model = controller.hostelsList[index];
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: hostelTile(
                          next: () {
                            Get.toNamed(AppRoutes.detail, arguments: model);
                          },
                          titleFont: 18,
                          height: context.getSize.height * 0.2,
                          width: context.getSize.width,
                          context: context,
                          model: model,
                          onTap: () {
                            controller.toggleFavoriteStatus(model);
                          }));
                }),
          ),
        ],
      ),
    );
  }
}
