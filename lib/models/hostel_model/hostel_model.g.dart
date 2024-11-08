// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostelModelImpl _$$HostelModelImplFromJson(Map<String, dynamic> json) =>
    _$HostelModelImpl(
      image: json['image'] as String? ?? AssetPaths.networkImage,
      fav: json['fav'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      price: json['price'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
    );

Map<String, dynamic> _$$HostelModelImplToJson(_$HostelModelImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'fav': instance.fav,
      'name': instance.name,
      'location': instance.location,
      'price': instance.price,
      'rating': instance.rating,
    };
