import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/validation_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/seeker/controller/booking_controller.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/cnic_formatter.dart';
import 'package:findyourhostel/utils/expanded_tile.dart';
import 'package:findyourhostel/utils/formatter/name_formatter.dart';
import 'package:findyourhostel/utils/formatter/phone_formatter.dart';
import 'package:findyourhostel/utils/loading_indicator.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BookScreen extends StatelessWidget {
  BookScreen({super.key});
  HostelAddModel model = Get.arguments;
  final controller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    controller.checkRoomType(model.roomType!);
    return Scaffold(
      appBar: AppBar(
        title: appText(
            context: context, title: 'Booking', textColor: AppColor.offWhite),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              context.heightBox(0.02),
              Image.asset(
                AssetPaths.logo,
                width: 200,
              ),
              context.heightBox(0.05),
              formatterField(
                  formatter: [NonNumericInputFormatter()],
                  context: context,
                  textInputType: TextInputType.name,
                  controller: controller.name,
                  hintText: 'Name'),
              context.heightBox(0.02),
              textField(
                  context: context,
                  controller: controller.email,
                  hintText: 'Email'),
              context.heightBox(0.02),
              formatterField(
                  formatter: [PhoneInputFormatter()],
                  context: context,
                  textInputType: TextInputType.number,
                  controller: controller.phone,
                  hintText: 'Phone'),
              context.heightBox(0.02),
              formatterField(
                  formatter: [
                    LengthLimitingTextInputFormatter(2),
                  ],
                  // readOnly: true,
                  // onTap: () {
                  //   controller.pickAge(context: context);
                  // },
                  context: context,
                  controller: controller.age,
                  textInputType: TextInputType.number,
                  hintText: 'Age'),
              context.heightBox(0.02),
              formatterField(
                  formatter: [CnicFormatter()],
                  context: context,
                  controller: controller.cnic,
                  textInputType: TextInputType.number,
                  hintText: 'CNIC'),
              context.heightBox(0.02),
              Row(
                children: [
                  Expanded(
                      child: textField(
                          readOnly: true,
                          onTap: () {
                            controller.checkInOut(
                                context: context, isCheckin: true);
                          },
                          context: context,
                          controller: controller.checkIn,
                          hintText: 'Check In')),
                  context.widthBox(0.02),
                  Expanded(
                      child: textField(
                          readOnly: true,
                          onTap: () {
                            controller.checkInOut(context: context);
                          },
                          context: context,
                          controller: controller.checkOut,
                          hintText: 'Check Out')),
                ],
              ),
              context.heightBox(0.02),
              textField(
                  readOnly: true,
                  onTap: () {
                    controller.toggleShowRoomType();
                  },
                  suffixIcon: GestureDetector(
                      child: Icon(controller.showRoomType
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down)),
                  context: context,
                  controller: controller.roomType,
                  hintText: 'Room Type'),
              context.heightBox(0.01),
              if (controller.showRoomType)
                expandedTile2(
                    context: context,
                    dataList: controller.newRoomTypeList,
                    onTap: (val, val2) {
                      controller.addRoomType(val, val2);
                      print(controller.selectedRoomType);
                    }),
              // if (controller.selectedRoomType == 0 ||
              //     controller.selectedRoomType == -1)
              //   SizedBox.shrink()
              // else
              //   context.heightBox(0.01),
              // if (controller.selectedRoomType == 0 ||
              //     controller.selectedRoomType == -1)
              //   const SizedBox.shrink()
              // else
              //   textField(
              //       textInputType: TextInputType.number,
              //       context: context,
              //       controller: controller.beds,
              //       hintText: 'How Many Beds'),
              context.heightBox(0.02),
              if (controller.loading)
                Center(
                  child: loading(),
                )
              else
                textButton(
                    context: context,
                    onTap: () {
                      List<String> checkOut =
                          controller.checkOut.text.split('-');
                      List<String> checkInt =
                          controller.checkIn.text.split('-');
                      if (controller.name.text.isEmpty) {
                        toast(msg: 'Please enter your name.', context: context);
                      } else if (controller.email.text.isEmpty) {
                        toast(
                            msg: 'Please enter your email.', context: context);
                      } else if (!controller.email.text.emailValidator()) {
                        toast(
                            msg: 'Please enter valid email.', context: context);
                      } else if (controller.phone.text.isEmpty) {
                        toast(
                            msg: 'Please enter your phone number.',
                            context: context);
                      } else if (controller.cnic.text.isEmpty) {
                        toast(msg: 'Please enter your CNIC.', context: context);
                      } else if (controller.checkIn.text.isEmpty) {
                        toast(
                            msg: 'Please pick check in date.',
                            context: context);
                      } else if (controller.checkOut.text.isEmpty) {
                        toast(
                            msg: 'Please pick check out date.',
                            context: context);
                      } else if (DateTime(int.parse(checkOut[2]),
                              int.parse(checkOut[1]), int.parse(checkOut[0]))
                          .isBefore(DateTime(
                              int.parse(checkInt[2]),
                              int.parse(checkInt[1]),
                              int.parse(checkInt[0])))) {
                        toast(
                            msg:
                                'Please pick check out date after check in date.',
                            context: context);
                      } else if (controller.selectedRoomType == -1) {
                        toast(msg: 'Please select room type', context: context);
                      } else {
                        JazzCashClass().openJazzCashPayment('5000', 'Ok');
                        controller.bookingHostel(
                            model: model, context: context);
                        controller.sendEmail(model.email!, model.name!);
                      }
                    },
                    title: 'Continue with payment')
            ],
          ),
        ),
      ),
    );
  }
}
