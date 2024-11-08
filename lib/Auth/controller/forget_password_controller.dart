import 'package:findyourhostel/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Future<void> sendPasswordResetEmail(String email,BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _loading.value = true;
    try {
      await _auth.sendPasswordResetEmail(email: email).whenComplete(() {
        _loading.value = false;
      });
      toast(msg:"Password reset email sent to $email", context: context);
      Get.back();
    } catch (e) {
      _loading.value = false;
      print("Error sending password reset email: $e");
      throw e; // Handle the error in your UI
    }
  }
}
