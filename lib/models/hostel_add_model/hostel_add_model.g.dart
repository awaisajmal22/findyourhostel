// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostelAddModelImpl _$$HostelAddModelImplFromJson(Map<String, dynamic> json) =>
    _$HostelAddModelImpl(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      uuid: json['uuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      address: json['address'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '',
      avalaibleRoom: json['avalaibleRoom'] as String? ?? '',
      avalaibleBed: json['avalaibleBed'] as String? ?? '',
      roomType: (json['roomType'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      policies: json['policies'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? -1,
      isActive: json['isActive'] as bool? ?? false,
      inActive: json['inActive'] as bool? ?? false,
      favorite: json['favorite'] as bool? ?? false,
      createdDate: json['createdDate'] as String? ?? '',
      docId: json['docId'] as String? ?? '',
      qrCode: json['qrCode'] as String? ?? '',
      long: (json['long'] as num?)?.toDouble() ?? -1.0,
      lat: (json['lat'] as num?)?.toDouble() ?? -1.0,
      review: (json['review'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HostelAddModelImplToJson(
        _$HostelAddModelImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'uuid': instance.uuid,
      'name': instance.name,
      'location': instance.location,
      'address': instance.address,
      'description': instance.description,
      'price': instance.price,
      'avalaibleRoom': instance.avalaibleRoom,
      'avalaibleBed': instance.avalaibleBed,
      'roomType': instance.roomType,
      'amenities': instance.amenities,
      'policies': instance.policies,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'isActive': instance.isActive,
      'inActive': instance.inActive,
      'favorite': instance.favorite,
      'createdDate': instance.createdDate,
      'docId': instance.docId,
      'qrCode': instance.qrCode,
      'long': instance.long,
      'lat': instance.lat,
      'review': instance.review,
    };

_$RoomTypeImpl _$$RoomTypeImplFromJson(Map<String, dynamic> json) =>
    _$RoomTypeImpl(
      type: (json['type'] as num?)?.toInt() ?? -1,
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$$RoomTypeImplToJson(_$RoomTypeImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      star: (json['star'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'star': instance.star,
      'description': instance.description,
      'uuid': instance.uuid,
    };
