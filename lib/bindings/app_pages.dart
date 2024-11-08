import 'package:findyourhostel/Auth/controller/forget_password_controller.dart';
import 'package:findyourhostel/Auth/screens/forget_password/forget_password_screen.dart';
import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/Auth/controller/login_controller.dart';

import 'package:findyourhostel/Auth/controller/signup_controller.dart';
import 'package:findyourhostel/Auth/controller/splash_controller.dart';
import 'package:findyourhostel/Auth/screens/login/login_screen.dart';

import 'package:findyourhostel/Auth/screens/signup/signup_screen.dart';
import 'package:findyourhostel/common/controller/profile_conroller.dart';
import 'package:findyourhostel/common/profile/profile_screen.dart';
import 'package:findyourhostel/recruiter/controller/add_hostel_controller.dart';
import 'package:findyourhostel/recruiter/controller/edit_hostel_controller.dart';
import 'package:findyourhostel/recruiter/controller/recruiter_dashboard_controller.dart';
import 'package:findyourhostel/recruiter/screens/add_hostel/add_hostel_screen.dart';
import 'package:findyourhostel/recruiter/screens/edit_hostel/edit_hostel_screen.dart';
import 'package:findyourhostel/recruiter/screens/home/recruiter_home_screen.dart';
import 'package:findyourhostel/seeker/controller/booking_controller.dart';
import 'package:findyourhostel/seeker/controller/detail_controller.dart';
import 'package:findyourhostel/seeker/controller/home_controller.dart';
import 'package:findyourhostel/seeker/controller/seeker_dashboard_controller.dart';
import 'package:findyourhostel/seeker/controller/seeker_search_controller.dart';
import 'package:findyourhostel/seeker/screens/booking/book_screen.dart';
import 'package:findyourhostel/seeker/screens/dashboard/seeker_dashboard_screen.dart';
import 'package:findyourhostel/seeker/screens/detail/detail_screen.dart';
import 'package:findyourhostel/seeker/screens/home/seeker_home_screen.dart';
import 'package:findyourhostel/Auth/screens/splash/splash_screen.dart';
import 'package:findyourhostel/seeker/screens/search/seeker_search_screen.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.forgetpassword,
      page: () => ForgetPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> ForgetPasswordController());
      }),
    ),
   
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> SignupController());
      }),
    ),
    GetPage(
      name: AppRoutes.seekerdashboard,
      page: () => SeekerDashboardScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> SeekerDashBoardController());
      }),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => SeekerSearchScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> SeekerSearchController());
      }),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> DetailController());
      }),
    ),
    GetPage(
      name: AppRoutes.booking,
      page: () =>  BookScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> BookingController());
      }),
    ),
    



    //Recruiter Side
    GetPage(
      name: AppRoutes.recruiterdashboard,
      page: () => RecruiterHomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> RecruiterDashBoardController());
        Get.lazyPut(()=> ProfileConroller());
      }),
    ),
    GetPage(
      name: AppRoutes.addhostel,
      page: () => AddHostelScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> AddHostelController());
      }),
    ),
    GetPage(
      name: AppRoutes.editHostel,
      page: () => EditHostelScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> EditHostelController());
      }),
    ),
    //common
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=> ProfileConroller());
      }),
    ),
  ];
}
