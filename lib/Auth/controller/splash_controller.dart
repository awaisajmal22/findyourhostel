import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/user_model/user_model.dart';
import 'package:findyourhostel/repositories/login/login_repo.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin{
  late LoginRepo _repo;
  late StorageRepo _storage;
@override
  void onInit() {
    _repo = getIt();
    _storage =getIt();
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    
    // Set up the animation to go from 0 to 1
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        // Update the Rx value when animation progresses
        animationValue.value = animation.value;
      });

    // Start the animation
    animationController.forward();
    autoLogin();
  }

  autoLogin()async{
final email = await _storage.getEmail();
final password =await _storage.getPassword();
if(email != '' && password != ''){
 final user = await _repo.login(context: Get.context!, email: email, password: password);
  if(user != UserModel.fromJson({})){
    
  
    if(user.role == 0){
        _storage.setGender(user.gender?? -1);
      Get.offAllNamed(AppRoutes.seekerdashboard);
    }else{
      Get.offAllNamed(AppRoutes.recruiterdashboard);
    }
  }else{
     Future.delayed(const Duration(seconds:  3), (){
      Get.offAllNamed(AppRoutes.login);
    });
    
  }
}else{
   Future.delayed(const Duration(seconds:  3), (){
      Get.offAllNamed(AppRoutes.login);
    });
}
  }

  late AnimationController animationController;
  late Animation<double> animation;

  // Rx variable to hold the animated value
  var animationValue = 0.0.obs;
   @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}