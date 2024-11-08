
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';
@Freezed()
class UserModel with _$UserModel {
  factory UserModel({
   @Default('') String? email,
   @Default('') String? name,
   @Default('') String? image,
   @Default('') String? phone,
   @Default('') String? uid,
   @Default('') String? dob,
   @Default(0) int? gender,
   @Default(-1) int? role,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}


