import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/user_model/user_model.dart';
import 'package:findyourhostel/repositories/login/login_repo.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  late LoginRepo _repo;
  late StorageRepo _storage;
@override
  void onInit() {
    _repo = getIt();
    _storage =getIt();
    // TODO: implement onInit
    super.onInit();
    autoLogin();
  }

  autoLogin()async{
final email = await _storage.getEmail();
final password =await _storage.getPassword();
if(email != '' && password != ''){
 final user = await _repo.login(context: Get.context!, email: email, password: password);
  if(user != UserModel.fromJson({})){
    
  
    if(user.role == 0){
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
}