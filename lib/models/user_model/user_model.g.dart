// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      role: (json['role'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
      'phone': instance.phone,
      'uid': instance.uid,
      'dob': instance.dob,
      'gender': instance.gender,
      'role': instance.role,
    };
