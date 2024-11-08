// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishListModelImpl _$$WishListModelImplFromJson(Map<String, dynamic> json) =>
    _$WishListModelImpl(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFav: json['isFav'] as bool? ?? false,
      rating: json['rating'] as String? ?? '',
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      location: json['location'] as String? ?? '',
      price: json['price'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
    );

Map<String, dynamic> _$$WishListModelImplToJson(_$WishListModelImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'isFav': instance.isFav,
      'rating': instance.rating,
      'name': instance.name,
      'address': instance.address,
      'location': instance.location,
      'price': instance.price,
      'phone': instance.phone,
      'createdDate': instance.createdDate,
    };
