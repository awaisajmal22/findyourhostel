import 'dart:io';

import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/recruiter/controller/add_hostel_controller.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/map_dialog.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AddHostelScreen extends StatelessWidget {
  AddHostelScreen({super.key});
  final controller = Get.find<AddHostelController>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkblue,
        title: appText(
            context: context,
            title: 'Add Hostel',
            textColor: AppColor.offWhite),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.heightBox(0.01),
              GestureDetector(
                onTap: () {
                  controller.pickMultiImages(context: context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  width: context.getSize.width,
                  decoration: BoxDecoration(
                      color: AppColor.offWhite,
                      boxShadow: [boxShadow(context: context)],
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: AppColor.black.withOpacity(0.4))),
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        size: context.getSize.height * 0.1,
                        color: AppColor.black.withOpacity(0.4),
                      ),
                      context.heightBox(0.02),
                      appText(
                        context: context,
                        title: 'Pick Photos',
                      )
                    ],
                  ),
                ),
              ),
              context.heightBox(0.02),
              if (controller.pickedImages.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children:
                        List.generate(controller.pickedImages.length, (index) {
                      return Container(
                        height: context.getSize.height * 0.1,
                        width: context.getSize.width * 0.2,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: FileImage(
                            File(controller.pickedImages[index]),
                          ),
                          fit: BoxFit.cover,
                        )),
                        child: GestureDetector(
                            onTap: () {
                              controller.removeImage(index);
                            },
                            child: Icon(Icons.close)),
                      );
                    }),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.heightBox(0.02),
                    appText(
                        context: context,
                        title: 'Basic Information',
                        textAlign: TextAlign.left),
                    context.heightBox(0.02),
                    textField(
                        context: context,
                        controller: controller.hostelname,
                        hintText: 'Hostel Name'),
                    context.heightBox(0.02),
                    textField(
                        readOnly: true,
                        onTap: () {
                          mapDialog(context: context, ct: controller);
                        },
                        context: context,
                        controller: controller.hostelAddress,
                        hintText: 'Hostel Map Address'),
                    context.heightBox(0.02),
                    textField(
                        context: context,
                        controller: controller.hostellocalAddress,
                        hintText: 'Hostel Local Address'),
                    context.heightBox(0.02),
                    textField2(
                        context: context,
                        controller: controller.description,
                        hintText: 'Description'),
                    context.heightBox(0.02),
                    // appText(
                    //     context: context,
                    //     title: 'Room and Pricing Information',
                    //     textAlign: TextAlign.left),
                    // context.heightBox(0.005),
                    // appText(
                    //     context: context,
                    //     title: 'Price',
                    //     textAlign: TextAlign.left),
                    // context.heightBox(0.02),
                    // textField(
                    //     context: context,
                    //     controller: controller.price,
                    //     textInputType: TextInputType.number,
                    //     hintText: 'Per Month Price'),
                    context.heightBox(0.02),
                    appText(
                        context: context,
                        title: 'Total Rooms/Beds Available',
                        textAlign: TextAlign.left),
                    context.heightBox(0.02),
                    Row(
                      children: [
                        Expanded(
                            child: textField(
                                context: context,
                                controller: controller.avalRoom,
                                textInputType: TextInputType.number,
                                hintText: 'Avaliable Room')),
                        context.widthBox(0.01),
                        Expanded(
                            child: textField(
                                context: context,
                                controller: controller.avalBed,
                                textInputType: TextInputType.number,
                                hintText: 'Avaliable Bed')),
                      ],
                    ),
                    context.heightBox(0.02),
                    appText(context: context, title: 'Gender'),
                    context.heightBox(0.01),
                    Row(
                      children:
                          List.generate(controller.gender.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              controller.selectGender(index);
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.black),
                                      shape: BoxShape.circle),
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            controller.selectedGender == index
                                                ? AppColor.black
                                                : AppColor.offWhite),
                                  ),
                                ),
                                context.widthBox(0.01),
                                appText(
                                    context: context,
                                    title: controller.gender[index],
                                    fontSize: 15)
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    context.heightBox(0.02),
                    appText(context: context, title: 'Room Type'),
                    Column(
                      children:
                          List.generate(controller.roomTypes.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: index == controller.roomTypes.length - 1
                                  ? 0
                                  : 5),
                          child: GestureDetector(
                            onTap: () {
                              if (controller
                                  .roomTypeController[index].text.isEmpty) {
                                toast(
                                    msg: 'Please enter price first.',
                                    context: context);
                              } else {
                                controller.selectRoomType(RoomType(
                                    type: index,
                                    price: controller
                                        .roomTypeController[index].text));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    value: controller.isRoomSelected[index],
                                    onChanged: (val) {
                                      if (controller.roomTypeController[index]
                                          .text.isEmpty) {
                                        toast(
                                            msg: 'Please enter price first.',
                                            context: context);
                                      } else {
                                        controller.selectRoomType(RoomType(
                                            type: index,
                                            price: controller
                                                .roomTypeController[index]
                                                .text));
                                      }
                                    }),
                                context.widthBox(0.005),
                                appText(
                                    context: context,
                                    title: controller.roomTypes[index],
                                    fontSize: 15),
                                const Spacer(),
                                SizedBox(
                                    width: context.getSize.width * 0.4,
                                    child: searchtextField(
                                        readOnly:
                                            controller.isRoomSelected[index],
                                        onChange: (v) {
                                          controller.roomTypeController[index]
                                              .text = v;
                                        },
                                        textInputType: TextInputType.number,
                                        context: context,
                                        controller: controller
                                            .roomTypeController[index],
                                        hintText: 'Enter Price'))
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    appText(context: context, title: 'Amenities'),
                    Column(
                      children:
                          List.generate(controller.aminties.length, (index) {
                        bool isSelect =
                            controller.selectedAmenitiesType.contains(index);
                        return GestureDetector(
                          onTap: () {
                            controller.selectAmenitiesType(index);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: isSelect == true ? true : false,
                                  onChanged: (val) {
                                    controller.selectAmenitiesType(index);
                                  }),
                              context.widthBox(0.005),
                              appText(
                                context: context,
                                title: controller.aminties[index],
                                fontSize: 15,
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    context.heightBox(0.02),
                    textField2(
                        context: context,
                        controller: controller.poilicy,
                        hintText: 'Policies'),
                    context.heightBox(0.02),
                    appText(context: context, title: 'Contact Information'),
                    context.heightBox(0.02),
                    textField(
                        context: context,
                        controller: controller.email,
                        hintText: 'Email'),
                    context.heightBox(0.02),
                    textField(
                        context: context,
                        textInputType: TextInputType.number,
                        controller: controller.phone,
                        hintText: 'Phone Number'),
                    context.heightBox(0.02),
                    GestureDetector(
                      onTap: () {
                        controller.pickQrCode();
                      },
                      child: Container(
                        height: context.getSize.height * 0.3,
                        width: context.getSize.width,
                        decoration: BoxDecoration(
                            boxShadow: [boxShadow(context: context)],
                            borderRadius: BorderRadius.circular(20),
                            image: controller.qrCode == ''
                                ? null
                                : DecorationImage(
                                    image: FileImage(File(controller.qrCode))),
                            color: AppColor.offWhite),
                        child: controller.qrCode == ''
                            ? Center(
                                child: appText(
                                    context: context, title: 'Payment QR CODE'),
                              )
                            : null,
                      ),
                    ),
                    context.heightBox(0.05),
                    if (controller.loading)
                      Center(
                        child: loading(),
                      )
                    else
                      textButton(
                          context: context,
                          onTap: () {
                            controller.addHostel(context: context);
                          },
                          title: 'Add Hostel'),
                    context.heightBox(0.02),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
