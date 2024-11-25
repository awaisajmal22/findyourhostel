import 'package:findyourhostel/bindings/app_pages.dart';
import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/repositories/addhostel/add_hostel_repo.dart';
import 'package:findyourhostel/repositories/addhostel/firebase_add_hostel_repo.dart';
import 'package:findyourhostel/repositories/login/firebase_login_repo.dart';
import 'package:findyourhostel/repositories/login/login_repo.dart';
import 'package:findyourhostel/repositories/signup/firebase_signup_repo.dart';
import 'package:findyourhostel/repositories/signup/signup_repo.dart';
import 'package:findyourhostel/repositories/storage/pref_storage_repo.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() async {
  serviceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.darkblue,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColor.darkblue),
        scaffoldBackgroundColor: AppColor.offWhite,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.black),
        useMaterial3: false,
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<SignupRepo>(() => FirebaseSignupRepo());
  getIt.registerLazySingleton<LoginRepo>(() => FirebaseLoginRepo());
  getIt.registerLazySingleton<StorageRepo>(() => PrefStorageRepo());
  getIt.registerLazySingleton<AddHostelRepo>(() => FirebaseAddHostelRepo());
}
