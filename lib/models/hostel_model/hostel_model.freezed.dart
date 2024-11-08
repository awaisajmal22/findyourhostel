// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hostel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HostelModel _$HostelModelFromJson(Map<String, dynamic> json) {
  return _HostelModel.fromJson(json);
}

/// @nodoc
mixin _$HostelModel {
  String? get image => throw _privateConstructorUsedError;
  bool? get fav => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostelModelCopyWith<HostelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostelModelCopyWith<$Res> {
  factory $HostelModelCopyWith(
          HostelModel value, $Res Function(HostelModel) then) =
      _$HostelModelCopyWithImpl<$Res, HostelModel>;
  @useResult
  $Res call(
      {String? image,
      bool? fav,
      String? name,
      String? location,
      String? price,
      String? rating});
}

/// @nodoc
class _$HostelModelCopyWithImpl<$Res, $Val extends HostelModel>
    implements $HostelModelCopyWith<$Res> {
  _$HostelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? fav = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: freezed == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HostelModelImplCopyWith<$Res>
    implements $HostelModelCopyWith<$Res> {
  factory _$$HostelModelImplCopyWith(
          _$HostelModelImpl value, $Res Function(_$HostelModelImpl) then) =
      __$$HostelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? image,
      bool? fav,
      String? name,
      String? location,
      String? price,
      String? rating});
}

/// @nodoc
class __$$HostelModelImplCopyWithImpl<$Res>
    extends _$HostelModelCopyWithImpl<$Res, _$HostelModelImpl>
    implements _$$HostelModelImplCopyWith<$Res> {
  __$$HostelModelImplCopyWithImpl(
      _$HostelModelImpl _value, $Res Function(_$HostelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? fav = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? price = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$HostelModelImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: freezed == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostelModelImpl implements _HostelModel {
  _$HostelModelImpl(
      {this.image = AssetPaths.networkImage,
      this.fav = false,
      this.name = '',
      this.location = '',
      this.price = '',
      this.rating = ''});

  factory _$HostelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostelModelImplFromJson(json);

  @override
  @JsonKey()
  final String? image;
  @override
  @JsonKey()
  final bool? fav;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? location;
  @override
  @JsonKey()
  final String? price;
  @override
  @JsonKey()
  final String? rating;

  @override
  String toString() {
    return 'HostelModel(image: $image, fav: $fav, name: $name, location: $location, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostelModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.fav, fav) || other.fav == fav) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, image, fav, name, location, price, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HostelModelImplCopyWith<_$HostelModelImpl> get copyWith =>
      __$$HostelModelImplCopyWithImpl<_$HostelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostelModelImplToJson(
      this,
    );
  }
}

abstract class _HostelModel implements HostelModel {
  factory _HostelModel(
      {final String? image,
      final bool? fav,
      final String? name,
      final String? location,
      final String? price,
      final String? rating}) = _$HostelModelImpl;

  factory _HostelModel.fromJson(Map<String, dynamic> json) =
      _$HostelModelImpl.fromJson;

  @override
  String? get image;
  @override
  bool? get fav;
  @override
  String? get name;
  @override
  String? get location;
  @override
  String? get price;
  @override
  String? get rating;
  @override
  @JsonKey(ignore: true)
  _$$HostelModelImplCopyWith<_$HostelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
