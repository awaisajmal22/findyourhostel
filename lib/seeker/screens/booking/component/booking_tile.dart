import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/booking_model/booking_model.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:findyourhostel/utils/rich_text.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

bookingTile(
    {required BuildContext context,
    required BookingModel model,
    required VoidCallback onTap,
    double titleFont = 15,
    double? height,
    required VoidCallback next,
    required VoidCallback cancelBooking,
    double? width}) {
  List<String> checkin = model.check_out!.split('-');
  HostelAddModel hostel = HostelAddModel.fromJson(model.hostel_model!);
  List<String> roomTypes = [
    'Private Room',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
    '6 Sharing',
  ];

  return GestureDetector(
    onTap: next,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width ?? context.getSize.width * 00.55,
      decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [boxShadow(context: context)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hostel.images == [])
            Shimmer.fromColors(
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(10),
                  height: context.getSize.height * 0.16,
                  width: width ?? context.getSize.width * 0.55,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
                baseColor: AppColor.darkblue.withOpacity(0.4),
                highlightColor: AppColor.darkblue.withOpacity(0.4))
          else
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(10),
              height: height ?? context.getSize.height * 0.16,
              width: width ?? context.getSize.width * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(hostel.images![0]), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onTap: onTap,
                child: FittedBox(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.offWhite, shape: BoxShape.circle),
                      child: Icon(
                        hostel.favorite!
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: hostel.favorite!
                            ? Colors.red.shade900
                            : AppColor.darkblue,
                      )),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.heightBox(0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: appText(
                          maxLine: 1,
                          context: context,
                          title: hostel.name!,
                          fontSize: titleFont,
                          fontWeight: FontWeight.bold),
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.star, size: 15),
                    //     context.widthBox(0.004),
                    //     appText(
                    //       context: context,
                    //       title: model.review!,
                    //       fontSize: 12,
                    //     )
                    //   ],
                    // )
                  ],
                ),
                context.heightBox(0.005),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, size: 15),
                    context.widthBox(0.005),
                    Expanded(
                      child: appText(
                        maxLine: 1,
                        context: context,
                        title: hostel.location!,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                context.heightBox(0.005),
                appText(
                    context: context,
                    title: '${hostel.price} PKR',
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                context.heightBox(0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneUri =
                            Uri(scheme: 'tel', path: hostel.phone!);
                        if (!await launchUrl(phoneUri)) {
                          throw Exception('Could not launch ${hostel.phone!}');
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColor.darkblue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.call,
                            size: 18,
                            color: AppColor.offWhite,
                          )),
                    ),
                    context.widthBox(0.01),
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneUri =
                            Uri(scheme: 'sms', path: hostel.phone!);
                        if (!await launchUrl(phoneUri)) {
                          throw Exception('Could not launch ${hostel.phone!}');
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColor.darkblue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.sms,
                            size: 18,
                            color: AppColor.offWhite,
                          )),
                    ),
                    context.widthBox(0.01),
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneUri =
                            Uri(scheme: 'mailto', path: hostel.email!);
                        if (!await launchUrl(phoneUri)) {
                          throw Exception('Could not launch ${hostel.phone!}');
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColor.darkblue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.mail,
                            size: 18,
                            color: AppColor.offWhite,
                          )),
                    ),
                    context.widthBox(0.01),
                    GestureDetector(
                      onTap: () async {
                        final Uri whatsappUri = Uri.parse(
                            'https://wa.me/${hostel.phone}?text=${Uri.encodeComponent('hi')}');
                        if (!await launchUrl(whatsappUri)) {
                          throw Exception('Could not launch ${hostel.phone!}');
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColor.darkblue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Ionicons.logo_whatsapp,
                            color: AppColor.offWhite,
                            size: 18,
                          )),
                    ),
                  ],
                ),
                context.heightBox(0.02),
                appText(
                    context: context,
                    title: 'Booking Detail',
                    fontWeight: FontWeight.bold),
                context.heightBox(0.01),

                // richText(
                //     context: context,
                //     title: 'Room Type',
                //     subtitle: roomTypes[]),
                richText(
                    context: context,
                    title: 'Gender',
                    subtitle: hostel.gender == 0 ? 'Male' : 'Female'),
                richText(
                    context: context,
                    title: 'Check In',
                    subtitle: model.check_in.toString()),
                richText(
                    context: context,
                    title: 'Check Out',
                    subtitle: model.check_out.toString()),
                context.heightBox(0.02),
                if (DateTime(int.parse(checkin[2]), int.parse(checkin[1]),
                        int.parse(checkin[0]))
                    .isBefore(DateTime.now().add(const Duration(days: 7))))
                  textButton(
                      context: context, onTap: cancelBooking, title: 'Cancel'),
                context.heightBox(0.01),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
