import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/user_model/user_model.dart';
import 'package:findyourhostel/repositories/login/login_repo.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool _obsecure = true.obs;
  bool get obsecure => _obsecure.value;
  toggleObsecure() {
    _obsecure.value = !_obsecure.value;
  }

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Future login({required BuildContext context}) async {
    _loading.value = true;
    final user = await _repo.login(
        context: context, email: email.text, password: password.text);
    if (user != UserModel.fromJson({})) {
      _storage.setEmail(user.email ?? '');
      _storage.setPassword(password.text ?? '');
      print("USER ID ${user.uid}");
      _storage.setUid(user.uid ?? '');
      _loading.value = false;
      if (user.role == 0) {
        Get.offAllNamed(AppRoutes.seekerdashboard);
      } else {
        Get.offAllNamed(AppRoutes.recruiterdashboard);
      }
    } else {
      _loading.value = false;
    }
  }

  late LoginRepo _repo;
  late StorageRepo _storage;
  @override
  void onInit() {
    _repo = getIt();
    _storage = getIt();
    // TODO: implement onInit
    super.onInit();
  }
}
