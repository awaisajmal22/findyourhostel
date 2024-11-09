import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/repositories/signup/signup_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController role = TextEditingController();
   List<String> roles = [
    'Hostel Seeker',
    'Recruiter',
  ];
  RxBool _isShowRole = false.obs;
  bool get isShowRole => _isShowRole.value;
  toggleShowRole() {
    _isShowRole.value = !_isShowRole.value;
  }

  RxBool _obsecure = true.obs;
  bool get obsecure => _obsecure.value;
  toggleObsecure() {
    _obsecure.value = !_obsecure.value;
  }

  RxBool _obsecure2 = true.obs;
  bool get obsecure2 => _obsecure2.value;
  toggleObsecure2() {
    _obsecure2.value = !_obsecure2.value;
  }

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  Future signup({required BuildContext context,}) async {
    _loading.value = true;
    bool isSuccess = await _repo.signup(
      gender: _selectedGender.value,
        context: context,
        email: email.text,
        password: password.text,
        role: role.text == 'Hostel Seeker' ? 0 : 1);
    if (isSuccess) {
      toast(msg: 'Account created successfully.', context: context);
      Get.back();
      _loading.value = false;
    } else {
      _loading.value = false;
    }
  }

  late SignupRepo _repo;
  @override
  void onInit() {
    _repo = getIt();
    super.onInit();
  }
  RxList<String> _gender = <String>[
    'Male',
    'Female',
  ].obs;
  List<String> get gender => _gender.value;
  RxInt _selectedGender = 0.obs;
  int get selectedGender => _selectedGender.value;
  selectGender(int index) {
    _selectedGender.value = index;
  }
}
