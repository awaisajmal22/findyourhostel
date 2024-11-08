// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      age: json['age'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      check_in: json['check_in'] as String? ?? '',
      check_out: json['check_out'] as String? ?? '',
      cnic: json['cnic'] as String? ?? '',
      bookerId: json['bookerId'] as String? ?? '',
      hostel_model: json['hostel_model'] as Map<String, dynamic>? ?? const {},
      roomType: (json['roomType'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'phone': instance.phone,
      'createdDate': instance.createdDate,
      'check_in': instance.check_in,
      'check_out': instance.check_out,
      'cnic': instance.cnic,
      'bookerId': instance.bookerId,
      'hostel_model': instance.hostel_model,
      'roomType': instance.roomType,
    };
