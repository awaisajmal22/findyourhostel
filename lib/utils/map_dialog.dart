import 'dart:io';

import 'package:findyourhostel/extensions/height_width_extension.dart';
import 'package:findyourhostel/extensions/size_extension.dart';
import 'package:findyourhostel/recruiter/controller/add_hostel_controller.dart';
import 'package:findyourhostel/recruiter/controller/edit_hostel_controller.dart';
import 'package:findyourhostel/utils/text_button.dart';
import 'package:findyourhostel/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mapDialog({required BuildContext context, required AddHostelController ct}) {
  return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: child,
        );
      },
      pageBuilder: (context, __, _) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: Platform.isAndroid
                          ? BorderRadius.circular(4)
                          : BorderRadius.circular(41)),
                  height: context.getSize.height * 0.5,
                  width: context.getSize.width * 0.8,
                  child: ct.currentLatLng == null
                      ? const Center(child: CircularProgressIndicator())
                      : Obx(
                          () => Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              ClipRRect(
                                borderRadius: Platform.isAndroid
                                    ? BorderRadius.circular(4)
                                    : BorderRadius.circular(41),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: ct.currentLatLng.value,
                                    zoom: 15,
                                  ),
                                  onMapCreated: (controller) {
                                    ct.mapController = controller;
                                  },
                                  markers: {
                                    Marker(
                                      markerId: MarkerId('draggedLocation'),
                                      position: ct.currentLatLng.value,
                                    ),
                                  },
                                  onCameraMove: (position) {
                                    ct.onCameraMove(position);
                                  },
                                  onCameraMoveStarted: () {
                                    ct.onCameraStartMove();
                                  },
                                  onCameraIdle: ct.onCameraIdle,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: searchtextField(
                                      onChange: (val) {
                                        ct.searchLocation(
                                          val: val!,
                                        );
                                      },
                                      context: context,
                                      controller: ct.search,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          ct.clearSearch();
                                        },
                                        child: Icon(Icons.close),
                                      ),
                                      hintText: 'Search location')),
                              if (Platform.isIOS)
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            ct.mapController.animateCamera(
                                                CameraUpdate.zoomIn());
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ct.mapController.animateCamera(
                                                CameraUpdate.zoomOut());
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.remove),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                ),
                context.heightBox(0.05),
                textButton(
                    context: context,
                    onTap: () {
                      Get.back();
                    },
                    title: 'Select',
                    radius: Platform.isAndroid ? 4 : 41)
              ],
            ),
          ),
        );
      });
}

editmapDialog({required BuildContext context, required EditHostelController ct}) {
  return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: child,
        );
      },
      pageBuilder: (context, __, _) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: Platform.isAndroid
                          ? BorderRadius.circular(4)
                          : BorderRadius.circular(41)),
                  height: context.getSize.height * 0.5,
                  width: context.getSize.width * 0.8,
                  child: ct.currentLatLng == null
                      ? const Center(child: CircularProgressIndicator())
                      : Obx(
                          () => Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              ClipRRect(
                                borderRadius: Platform.isAndroid
                                    ? BorderRadius.circular(4)
                                    : BorderRadius.circular(41),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: ct.currentLatLng.value,
                                    zoom: 15,
                                  ),
                                  onMapCreated: (controller) {
                                    ct.mapController = controller;
                                  },
                                  markers: {
                                    Marker(
                                      markerId: MarkerId('draggedLocation'),
                                      position: ct.currentLatLng.value,
                                    ),
                                  },
                                  onCameraMove: (position) {
                                    ct.onCameraMove(position);
                                  },
                                  onCameraMoveStarted: () {
                                    ct.onCameraStartMove();
                                  },
                                  onCameraIdle: ct.onCameraIdle,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: searchtextField(
                                      onChange: (val) {
                                        ct.searchLocation(
                                          val: val!,
                                        );
                                      },
                                      context: context,
                                      controller: ct.search,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          ct.clearSearch();
                                        },
                                        child: Icon(Icons.close),
                                      ),
                                      hintText: 'Search location')),
                              if (Platform.isIOS)
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            ct.mapController.animateCamera(
                                                CameraUpdate.zoomIn());
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ct.mapController.animateCamera(
                                                CameraUpdate.zoomOut());
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.remove),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                ),
                context.heightBox(0.05),
                textButton(
                    context: context,
                    onTap: () {
                      Get.back();
                    },
                    title: 'Select',
                    radius: Platform.isAndroid ? 4 : 41)
              ],
            ),
          ),
        );
      });
}
