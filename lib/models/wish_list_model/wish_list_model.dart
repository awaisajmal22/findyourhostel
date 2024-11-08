

import 'package:freezed_annotation/freezed_annotation.dart';
part 'wish_list_model.freezed.dart';
part 'wish_list_model.g.dart';
@Freezed()
class WishListModel with _$WishListModel{
  factory WishListModel({
  @Default([]) List<String>? images,
  @Default(false) bool? isFav,
  @Default('') String? rating,
  @Default('') String? name,
  @Default('') String? address,
  @Default('') String? location,
  @Default('') String? price,
  @Default('') String? phone,
  @Default('') String? createdDate,

  })= _WishListModel;
  factory WishListModel.fromJson(Map<String, dynamic> json) => _$WishListModelFromJson(json);
}