import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/booking_model/booking_model.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/recruiter/controller/recruiter_booking_controller.dart';
import 'package:findyourhostel/seeker/screens/booking/component/booking_tile.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecruiterBookingScreen extends StatelessWidget {
  RecruiterBookingScreen({super.key});
  final controller = Get.put(RecruiterBookingController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.bookedHostel.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  BookingModel model = controller.bookedHostel[index];
                  HostelAddModel hostel =
                      HostelAddModel.fromJson(model.hostel_model!);
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: bookingTile(
                          isRecruiter: true,
                          cancelBooking: () {
                            controller.deleteBooking(model.createdDate!,
                                hostel.email!, hostel.name!, model.name!);
                          },
                          next: () {
                            Get.toNamed(AppRoutes.detail,
                                arguments: HostelAddModel.fromJson(
                                    model.hostel_model!));
                          },
                          titleFont: 18,
                          height: context.getSize.height * 0.2,
                          width: context.getSize.width,
                          context: context,
                          model: model,
                          onTap: () {
                            // controller.toggleFavoriteStatus(model);
                          }));
                }),
          ),
        ],
      ),
    );
  }
}
