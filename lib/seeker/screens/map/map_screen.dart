import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/seeker/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final controller = Get.find<SeekerHomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.hostelsList.isEmpty
          ? const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(30.3753, 69.3451),
                zoom: 12,
              ),
            )
          : Obx(
              () => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.hostelsList[0].lat ?? 0.0,
                      controller.hostelsList[0].long ?? 0.0),
                  zoom: 6,
                ),
                onMapCreated: (ct) async {
                  controller.createCustomMarker();
                },
                markers: controller.hostelsList.map((hostel) {
                  return controller.icon.value == null
                      ? Marker(
                              markerId: MarkerId(hostel.address ?? ''),
                              position:
                                  LatLng(hostel.lat ?? 0.0, hostel.long ?? 0.0))
                          .copyWith(
                          onTapParam: () {
                            Get.toNamed(AppRoutes.detail, arguments: hostel);
                          },
                        )
                      : Marker(
                              markerId: MarkerId(hostel.address ?? ''),
                              icon: controller.icon.value ??
                                  BitmapDescriptor.defaultMarker,
                              position:
                                  LatLng(hostel.lat ?? 0.0, hostel.long ?? 0.0))
                          .copyWith(
                          onTapParam: () {
                            Get.toNamed(AppRoutes.detail, arguments: hostel);
                          },
                        );
                }).toSet(),
              ),
            ),
    );
  }
}
