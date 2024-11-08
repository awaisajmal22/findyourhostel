// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  int? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? email,
      String? name,
      String? image,
      String? phone,
      String? uid,
      String? dob,
      int? gender,
      int? role});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? phone = freezed,
    Object? uid = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? name,
      String? image,
      String? phone,
      String? uid,
      String? dob,
      int? gender,
      int? role});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? phone = freezed,
    Object? uid = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? role = freezed,
  }) {
    return _then(_$UserModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {this.email = '',
      this.name = '',
      this.image = '',
      this.phone = '',
      this.uid = '',
      this.dob = '',
      this.gender = 0,
      this.role = -1});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String? email;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? image;
  @override
  @JsonKey()
  final String? phone;
  @override
  @JsonKey()
  final String? uid;
  @override
  @JsonKey()
  final String? dob;
  @override
  @JsonKey()
  final int? gender;
  @override
  @JsonKey()
  final int? role;

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, image: $image, phone: $phone, uid: $uid, dob: $dob, gender: $gender, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, name, image, phone, uid, dob, gender, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String? email,
      final String? name,
      final String? image,
      final String? phone,
      final String? uid,
      final String? dob,
      final int? gender,
      final int? role}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get phone;
  @override
  String? get uid;
  @override
  String? get dob;
  @override
  int? get gender;
  @override
  int? get role;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
