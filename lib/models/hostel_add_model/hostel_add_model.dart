 
 import 'package:freezed_annotation/freezed_annotation.dart';
part 'hostel_add_model.freezed.dart';
part 'hostel_add_model.g.dart';
@Freezed()
 class HostelAddModel with _$HostelAddModel{
  factory HostelAddModel({
    @Default([]) List<String>? images,
    @Default('') String? uuid,
    @Default('') String? name,
    @Default('') String? location,
    @Default('') String? address,
    @Default('') String? description,
    @Default('') String? price,
    @Default('') String? avalaibleRoom,
    @Default('') String? avalaibleBed,
    @Default([]) List<Map<String, dynamic>>? roomType,
    @Default([]) List<int>? amenities,
    @Default('') String? policies,
    @Default('') String? email,
    @Default('') String? phone,
    @Default(-1) int? gender,
    @Default(false) bool? favorite,

    @Default('') String? createdDate,
    @Default('') String? docId,
    @Default('') String? qrCode,
    @Default(-1.0) double? long,
    @Default(-1.0) double ? lat,
    @Default([]) List<Map<String, dynamic>>? review,
  
  })=_HostelAddModel;
  factory HostelAddModel.fromJson(Map<String, dynamic> json) => _$HostelAddModelFromJson(json);
 }

 @Freezed()
 class RoomType with _$RoomType{
  factory RoomType({
    @Default(-1) int ? type,
    @Default('') String ? price,
  }) = _RoomType;
  factory RoomType.fromJson(Map<String, dynamic> json) => _$RoomTypeFromJson(json);
 }

 @Freezed()
 class Review with _$Review{
  factory Review({
    @Default('') String ? image,
    @Default('') String ? name,
    @Default(0.0) double ? star,
    @Default('') String ? description,
    @Default('') String ? uuid,
  })= _Review;
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
 }