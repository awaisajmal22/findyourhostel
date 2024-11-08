// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WishListModel _$WishListModelFromJson(Map<String, dynamic> json) {
  return _WishListModel.fromJson(json);
}

/// @nodoc
mixin _$WishListModel {
  List<String>? get images => throw _privateConstructorUsedError;
  bool? get isFav => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishListModelCopyWith<WishListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListModelCopyWith<$Res> {
  factory $WishListModelCopyWith(
          WishListModel value, $Res Function(WishListModel) then) =
      _$WishListModelCopyWithImpl<$Res, WishListModel>;
  @useResult
  $Res call(
      {List<String>? images,
      bool? isFav,
      String? rating,
      String? name,
      String? address,
      String? location,
      String? price,
      String? phone,
      String? createdDate});
}

/// @nodoc
class _$WishListModelCopyWithImpl<$Res, $Val extends WishListModel>
    implements $WishListModelCopyWith<$Res> {
  _$WishListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? isFav = freezed,
    Object? rating = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? phone = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFav: freezed == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishListModelImplCopyWith<$Res>
    implements $WishListModelCopyWith<$Res> {
  factory _$$WishListModelImplCopyWith(
          _$WishListModelImpl value, $Res Function(_$WishListModelImpl) then) =
      __$$WishListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? images,
      bool? isFav,
      String? rating,
      String? name,
      String? address,
      String? location,
      String? price,
      String? phone,
      String? createdDate});
}

/// @nodoc
class __$$WishListModelImplCopyWithImpl<$Res>
    extends _$WishListModelCopyWithImpl<$Res, _$WishListModelImpl>
    implements _$$WishListModelImplCopyWith<$Res> {
  __$$WishListModelImplCopyWithImpl(
      _$WishListModelImpl _value, $Res Function(_$WishListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? isFav = freezed,
    Object? rating = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? phone = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$WishListModelImpl(
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFav: freezed == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WishListModelImpl implements _WishListModel {
  _$WishListModelImpl(
      {final List<String>? images = const [],
      this.isFav = false,
      this.rating = '',
      this.name = '',
      this.address = '',
      this.location = '',
      this.price = '',
      this.phone = '',
      this.createdDate = ''})
      : _images = images;

  factory _$WishListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WishListModelImplFromJson(json);

  final List<String>? _images;
  @override
  @JsonKey()
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool? isFav;
  @override
  @JsonKey()
  final String? rating;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? address;
  @override
  @JsonKey()
  final String? location;
  @override
  @JsonKey()
  final String? price;
  @override
  @JsonKey()
  final String? phone;
  @override
  @JsonKey()
  final String? createdDate;

  @override
  String toString() {
    return 'WishListModel(images: $images, isFav: $isFav, rating: $rating, name: $name, address: $address, location: $location, price: $price, phone: $phone, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishListModelImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isFav, isFav) || other.isFav == isFav) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      isFav,
      rating,
      name,
      address,
      location,
      price,
      phone,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WishListModelImplCopyWith<_$WishListModelImpl> get copyWith =>
      __$$WishListModelImplCopyWithImpl<_$WishListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WishListModelImplToJson(
      this,
    );
  }
}

abstract class _WishListModel implements WishListModel {
  factory _WishListModel(
      {final List<String>? images,
      final bool? isFav,
      final String? rating,
      final String? name,
      final String? address,
      final String? location,
      final String? price,
      final String? phone,
      final String? createdDate}) = _$WishListModelImpl;

  factory _WishListModel.fromJson(Map<String, dynamic> json) =
      _$WishListModelImpl.fromJson;

  @override
  List<String>? get images;
  @override
  bool? get isFav;
  @override
  String? get rating;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get location;
  @override
  String? get price;
  @override
  String? get phone;
  @override
  String? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$WishListModelImplCopyWith<_$WishListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
