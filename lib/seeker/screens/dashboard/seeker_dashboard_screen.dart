import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/seeker/controller/seeker_dashboard_controller.dart';
import 'package:findyourhostel/seeker/screens/booking/booking_list_screen.dart';

import 'package:findyourhostel/seeker/screens/home/seeker_home_screen.dart';
import 'package:findyourhostel/seeker/screens/wish_list/wish_list_screen.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SeekerDashboardScreen extends StatelessWidget {
  SeekerDashboardScreen({super.key});
  final controller = Get.find<SeekerDashBoardController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(child: _selectedScreen(controller.selectedNavIndex)),
        bottomNavigationBar: SizedBox(
          height: context.getSize.height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(controller.navbar.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.onSelectNav(index);
                  if (index == 3) {
                    controller.logout();
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      controller.navbar[index].icon,
                      color: index == controller.selectedNavIndex
                          ? AppColor.darkblue
                          : AppColor.black.withOpacity(0.5),
                    ),
                    context.heightBox(0.005),
                    appText(
                        context: context,
                        title: controller.navbar[index].name,
                        textColor: index == controller.selectedNavIndex
                            ? AppColor.darkblue
                            : AppColor.black.withOpacity(0.5),
                        fontSize: 12)
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _selectedScreen(int index) {
    switch (index) {
      case 0:
        return SeekerHomeScreen();
      case 1:
        return WishListScreen();
      case 2:
        return BookingListScreen();
      case 3:
        return Container();
      default:
        return const SizedBox();
    }
  }
}
