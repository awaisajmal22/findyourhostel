import 'package:findyourhostel/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

abstract class LoginRepo{
Future<UserModel> login({required BuildContext context, required String email, required String password});
}