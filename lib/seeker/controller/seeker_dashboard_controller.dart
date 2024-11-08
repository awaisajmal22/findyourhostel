import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SeekerDashBoardController extends GetxController {
  logout() {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signOut();
    _storage.clearSession();
    Get.offAllNamed(AppRoutes.login);
  }

  late StorageRepo _storage;
  @override
  void onInit() {
    _storage = getIt();
    // TODO: implement onInit
    super.onInit();
  }

  List<NavBarModel> navbar = <NavBarModel>[
    NavBarModel(icon: Ionicons.home, name: 'Home'),
    NavBarModel(icon: Ionicons.heart, name: 'Wish List'),
    NavBarModel(icon: Ionicons.book, name: 'Booking'),
    NavBarModel(icon: Ionicons.log_out, name: 'Log Out'),
  ];

  RxInt _selectNavIndex = 0.obs;
  int get selectedNavIndex => _selectNavIndex.value;
  onSelectNav(int index) {
    _selectNavIndex.value = index;
  }
}

class NavBarModel {
  final IconData icon;
  final String name;
  NavBarModel({required this.icon, required this.name});
}
