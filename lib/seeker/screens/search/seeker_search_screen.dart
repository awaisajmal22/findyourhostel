import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/seeker/controller/seeker_dashboard_controller.dart';
import 'package:findyourhostel/seeker/controller/seeker_search_controller.dart';
import 'package:findyourhostel/seeker/screens/search/component/search_hostel_tile.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SeekerSearchScreen extends StatelessWidget {
  SeekerSearchScreen({super.key});
  final controller = Get.find<SeekerSearchController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkblue,
        title: appText(
            context: context, title: 'Search', textColor: AppColor.offWhite),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              context.heightBox(0.02),
              searchtextField(
                  onChange: (val) {
                    controller.searchHostel(val);
                  },
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.ChangeListView();
                    },
                    child: controller.isListView
                        ? Icon(Icons.grid_4x4)
                        : Icon(Ionicons.list),
                  ),
                  context: context,
                  controller: controller.search,
                  hintText: 'Search Hostel'),
              context.heightBox(0.01),
              controller.filterList.isEmpty
                  ? Expanded(
                      child: Center(
                        child: appText(
                            context: context, title: 'No Search Hostel Yet.'),
                      ),
                    )
                  : Expanded(
                      child: controller.isListView
                          ? ListView.builder(
                              itemCount: controller.filterList.length,
                              itemBuilder: (context, index) {
                                HostelAddModel model =
                                    controller.filterList[index];
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: searchHostelTile(
                                        context: context, model: model));
                              })
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.filterList.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent:
                                          context.getSize.height * 0.275,
                                      mainAxisSpacing: 15,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                HostelAddModel model =
                                    controller.filterList[index];
                                print(
                                    "Hostel Length ${controller.hostelsList.length}");
                                return searchHostelTile(
                                    isList: false,
                                    context: context,
                                    width: double.infinity,
                                    model: model);
                              }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
