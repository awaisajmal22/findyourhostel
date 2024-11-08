

import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'hostel_model.freezed.dart';
part 'hostel_model.g.dart';
@Freezed()
class HostelModel with _$HostelModel{
  factory HostelModel({
  @Default(AssetPaths.networkImage) String ? image,
  @Default(false) bool ? fav,
  @Default('') String ? name,
  @Default('') String ? location,
  @Default('') String ? price,
  @Default('') String? rating,
  }) = _HostelModel;
  factory HostelModel.fromJson(Map<String, dynamic> json)=> _$HostelModelFromJson(json);

}