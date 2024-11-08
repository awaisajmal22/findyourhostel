import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/user_model/user_model.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileConroller extends GetxController {
  RxString _image = ''.obs;
  String get image => _image.value;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController uid = TextEditingController();
  pickImage() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      _image.value = picker.path;
    }
  }

  pickDateOfBirth({required BuildContext context}) async {
    DateTime? date = await showDatePicker(
        context: context, firstDate: DateTime(1947), lastDate: DateTime.now());
    if (date != null) {
      dob.text = DateFormat('yyyy-MM-dd').format(date);
    }
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

  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  getProfile() async {
    _firebase
        .collection('users')
        .doc(await storageRepo.getUid())
        .snapshots()
        .listen((d) {
      Map<String, dynamic> data = d.data() as Map<String, dynamic>;
      var model = UserModel.fromJson(data);
      name.text = model.name!;
      dob.text = model.dob!;
      phone.text = model.phone!;
      email.text = model.email!;
      role.text = model.role!.toString();
      uid.text = model.uid!;
      _image.value = model.image!;
      _selectedGender.value = model.gender!;
    });
  }

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  updateProfile({required BuildContext context}) async {
    _loading.value = true;
    try {
      UserModel model = UserModel();
      if (!_image.value.contains('https') && _image.value != '') {
        String fetchImage = await _uploadImageAndGetUrl(_image.value);
        model = UserModel(
          name: name.text,
          email: email.text,
          phone: phone.text,
          image: fetchImage,
          dob: dob.text,
          role: int.parse(role.text),
          gender: _selectedGender.value,
          uid: uid.text,
        );
      } else {
        model = UserModel(
          name: name.text,
          email: email.text,
          phone: phone.text,
          image: _image.value,
          dob: dob.text,
          role: int.parse(role.text),
          gender: _selectedGender.value,
          uid: uid.text,
        );
      }

      _firebase
          .collection('users')
          .doc(await storageRepo.getUid())
          .update(model.toJson())
          .whenComplete(() {
        _loading.value = false;
        toast(msg: 'Profile Update Successfully.', context: context);
      });
    } catch (e) {
      print('Update Profile Error $e');
    }
  }

  late StorageRepo storageRepo;
  @override
  void onInit() {
    storageRepo = getIt();
    getProfile();
    // TODO: implement onInit
    super.onInit();
  }
logout() {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signOut();
    storageRepo.clearSession();
    Get.offAllNamed(AppRoutes.login);
  }

  Future<String> _uploadImageAndGetUrl(
    String? filePath,
  ) async {
    Reference storage = FirebaseStorage.instance.ref();
    if (filePath == null || filePath.isEmpty) return '';

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Create a unique file path in Firebase Storage
      final uploadTask =
          storage.child('profileImage/$fileName.jpg').putFile(File(filePath));

      // Wait until the file is uploaded
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image : $e');
      return ''; // Return an empty string if there's an error
    }
  }
}
