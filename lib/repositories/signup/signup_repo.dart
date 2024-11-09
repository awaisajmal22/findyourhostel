import 'package:flutter/widgets.dart';

abstract class SignupRepo{
  Future<bool> signup({
    required BuildContext context,
    required String email,required String password,
    required int role,
    required int gender,
  }) ;
}