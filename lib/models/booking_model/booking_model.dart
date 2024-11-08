import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/models/hostel_model/hostel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_model.freezed.dart';
part 'booking_model.g.dart';
@Freezed()
class BookingModel with _$BookingModel{
  factory BookingModel({

@Default('') String? name,
@Default('') String? email,
@Default('') String? age,
@Default('') String? phone,
@Default('') String? createdDate,
@Default('') String? check_in,
@Default('') String? check_out,
@Default('') String? cnic,
@Default('') String? bookerId,
@Default({}) Map<String,dynamic>? hostel_model,
@Default(-1) int? roomType,
  }) =_BookingModel;
  factory BookingModel.fromJson(Map<String,dynamic> json) => _$BookingModelFromJson(json);
}