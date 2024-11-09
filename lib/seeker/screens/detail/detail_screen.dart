import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/seeker/controller/detail_controller.dart';
import 'package:findyourhostel/seeker/screens/detail/component/review_bottom_sheet.dart';
import 'package:findyourhostel/seeker/screens/detail/component/star_rating.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});
  HostelAddModel model = Get.arguments;
  final controller = Get.find<DetailController>();
  @override
  Widget build(BuildContext context) {
    controller.getHostelReviews(model.docId!);
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: context.getSize.height * 0.35,
              width: context.getSize.width,
              child: Stack(
                children: [
                  PageView.builder(
                      onPageChanged: (val) {
                        controller.onImageChange(val);
                      },
                      itemCount: model.images!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(model.images![index]),
                                  fit: BoxFit.fill)),
                        );
                      }),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: AppColor.offWhite,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              model.favorite!
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: 20,
                              color: model.favorite!
                                  ? Colors.red.shade900
                                  : AppColor.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration:
                          BoxDecoration(color: AppColor.black.withOpacity(0.4)),
                      child: appText(
                          context: context,
                          title:
                              '${controller.selectImage + 1}/${model.images!.length}',
                          fontSize: 12,
                          textColor: AppColor.offWhite),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        reviewBottomSheet(
                          model: model,
                          context: context,
                          controller: controller,
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColor.black.withOpacity(0.4)),
                        child: appText(
                            context: context,
                            title: 'Review',
                            fontSize: 12,
                            textColor: AppColor.offWhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            context.heightBox(0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(model.images!.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.black,
                    ),
                    color: controller.selectImage == index
                        ? AppColor.black
                        : AppColor.offWhite,
                  ),
                );
              }),
            ),
            context.heightBox(0.02),
            Expanded(
              child: SingleChildScrollView(
                physics: controller.onMapCameraMove == false
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.heightBox(0.01),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColor.offWhite,
                        boxShadow: [boxShadow(context: context)],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText(
                              context: context,
                              title: model.name!,
                              fontWeight: FontWeight.bold),
                          context.heightBox(0.01),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red.shade900,
                              ),
                              context.widthBox(0.01),
                              Expanded(
                                  child: appText(
                                      maxLine: 2,
                                      context: context,
                                      textAlign: TextAlign.left,
                                      title: model.address!,
                                      fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'Avaliable Room',
                      fontWeight: FontWeight.bold,
                    ),
                    context.heightBox(0.01),
                    appText(
                      context: context,
                      fontSize: 15,
                      title:
                          "${controller.getAvailableRoom(model.name!, int.parse(model.avalaibleRoom!))} Rooms",
                    ),
                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'Avaliable Occupancy',
                      fontWeight: FontWeight.bold,
                    ),
                    context.heightBox(0.01),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              List.generate(model.roomType!.length, (index) {
                        RoomType roomType =
                            RoomType.fromJson(model.roomType![index]);
                        return Container(
                            margin: const EdgeInsets.only(
                                right: 10, bottom: 15, top: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            width: context.getSize.width * 0.5,
                            decoration: BoxDecoration(
                              boxShadow: [
                                boxShadow(
                                  context: context,
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.offWhite,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                appText(
                                    textColor: AppColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    context: context,
                                    title:
                                        controller.roomTypes[roomType.type!]),
                                appText(
                                    textColor: AppColor.black,
                                    fontSize: 14,
                                    context: context,
                                    title: 'PKR ${roomType.price}'),
                              ],
                            ));
                      })),
                    ),
                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'Gender',
                      fontWeight: FontWeight.bold,
                    ),
                    appText(
                        textColor: AppColor.black,
                        fontSize: 14,
                        context: context,
                        title: model.gender == 0 ? 'Male' : 'Female'),

                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'Avaliable Occupancy',
                      fontWeight: FontWeight.bold,
                    ),
                    context.heightBox(0.01),
                    GridView(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 50,
                            crossAxisCount: 2),
                        children:
                            List.generate(model.amenities!.length, (index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.offWhite,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  controller
                                      .aminties[model.amenities![index]].icon,
                                  color: Colors.blue,
                                ),
                                context.widthBox(0.01),
                                appText(
                                    textColor: AppColor.black,
                                    fontSize: 14,
                                    context: context,
                                    title: controller
                                        .aminties[model.amenities![index]]
                                        .title)
                              ],
                            ),
                          );
                        })),
                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'About',
                      fontWeight: FontWeight.bold,
                    ),
                    context.heightBox(0.01),
                    appText(
                        maxLine: 10,
                        context: context,
                        title: model.description!,
                        fontSize: 15),
                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'Map Location',
                      fontWeight: FontWeight.bold,
                    ),
                    context.heightBox(0.01),
                    GestureDetector(
                      onDoubleTap: () {
                        MapsLauncher.launchQuery(model.location!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [boxShadow(context: context)],
                            borderRadius: BorderRadius.circular(10)),
                        height: context.getSize.height * 0.3,
                        width: context.getSize.width,
                        child: GoogleMap(
                            scrollGesturesEnabled: false,
                            onCameraMoveStarted: () {
                              controller.onCameraMove(true);
                            },
                            onCameraMove: (val) {
                              controller.onCameraMove(true);
                            },
                            onCameraIdle: () {
                              controller.onCameraMove(false);
                            },
                            markers: {
                              Marker(
                                position: LatLng(model.lat!, model.long!),
                                markerId: MarkerId('Abc'),
                              )
                            },
                            initialCameraPosition: CameraPosition(
                              zoom: 16.0,
                              target: LatLng(model.lat!, model.long!),
                            )),
                      ),
                    ),
                    context.heightBox(0.02),
                    appText(
                      context: context,
                      title: 'Policies',
                      fontWeight: FontWeight.bold,
                    ),
                    context.heightBox(0.01),
                    appText(
                        maxLine: 10,
                        context: context,
                        title: model.policies!,
                        fontSize: 15),
                    context.heightBox(0.02),
                    Container(
                      height: context.getSize.height * 0.3,
                      width: context.getSize.width,
                      decoration: BoxDecoration(
                          boxShadow: [boxShadow(context: context)],
                          borderRadius: BorderRadius.circular(20),
                          image: model.qrCode == null || model.qrCode == ''
                              ? null
                              : DecorationImage(
                                  image: NetworkImage(model.qrCode!)),
                          color: AppColor.offWhite),
                      child: model.qrCode == null || model.qrCode == ''
                          ? Center(
                              child: appText(
                                  context: context, title: 'Payment QR CODE'),
                            )
                          : null,
                    ),
                    context.heightBox(0.02),
                    if (model.review != null || model.review!.isNotEmpty)
                      appText(
                        context: context,
                        title: 'Reviews',
                        fontWeight: FontWeight.bold,
                      ),
                    context.heightBox(0.01),
                    if (model.review != null || model.review!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children:
                              List.generate(model.review!.length, (index) {
                            Review review =
                                Review.fromJson(model.review![index]);
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: context.height * 0.26,
                              width: context.getSize.width * 0.7,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.offWhite,
                                  boxShadow: [
                                    boxShadow(
                                        context: context, x: 0, y: 0, blur: 3)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: review.image == null ||
                                                    review.image == ''
                                                ? null
                                                : DecorationImage(
                                                    image: NetworkImage(
                                                        review.image!),
                                                    fit: BoxFit.cover)),
                                        child: review.image == null ||
                                                review.image == ''
                                            ? Icon(Icons.person)
                                            : null,
                                      ),
                                      context.widthBox(0.01),
                                      appText(
                                          context: context,
                                          title: review.name!,
                                          fontSize: 16),
                                    ],
                                  ),
                                  context.heightBox(0.01),
                                  StarRating(rating: review.star!),
                                  context.heightBox(0.01),
                                  appText(
                                      context: context,
                                      maxLine: 4,
                                      title: review.description!,
                                      fontSize: 15),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    context.heightBox(0.02),
                    if (int.parse(controller.getAvailableRoom(
                            model.name!, int.parse(model.avalaibleRoom!))) <=
                        0)
                      Center(
                          child: appText(
                              context: context,
                              title: "No Room Avaliable\nPlease Come Later"))
                    else if (controller.gender == model.gender)
                      textButton(
                          context: context,
                          onTap: () {
                            Get.toNamed(AppRoutes.booking, arguments: model);
                          },
                          title: 'BOOK')
                    else
                      Center(
                          child: appText(
                              textColor: Colors.red,
                              context: context,
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              title:
                                  "Kindly Sign In with your ${controller.gender == 0 ? 'Female' : 'Male'} Account\nFor Booking")),
                    context.heightBox(0.05)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
