// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEditState {
  Uint8List? get uint8List => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditStateCopyWith<ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res, ProfileEditState>;
  @useResult
  $Res call({Uint8List? uint8List, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res, $Val extends ProfileEditState>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uint8List = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      uint8List: freezed == uint8List
          ? _value.uint8List
          : uint8List // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileEditStateCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory _$$_ProfileEditStateCopyWith(
          _$_ProfileEditState value, $Res Function(_$_ProfileEditState) then) =
      __$$_ProfileEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List? uint8List, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ProfileEditStateCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$_ProfileEditState>
    implements _$$_ProfileEditStateCopyWith<$Res> {
  __$$_ProfileEditStateCopyWithImpl(
      _$_ProfileEditState _value, $Res Function(_$_ProfileEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uint8List = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ProfileEditState(
      uint8List: freezed == uint8List
          ? _value.uint8List
          : uint8List // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_ProfileEditState implements _ProfileEditState {
  _$_ProfileEditState({this.uint8List, this.user});

  @override
  final Uint8List? uint8List;
  @override
  final User? user;

  @override
  String toString() {
    return 'ProfileEditState(uint8List: $uint8List, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileEditState &&
            const DeepCollectionEquality().equals(other.uint8List, uint8List) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(uint8List), user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileEditStateCopyWith<_$_ProfileEditState> get copyWith =>
      __$$_ProfileEditStateCopyWithImpl<_$_ProfileEditState>(this, _$identity);
}

abstract class _ProfileEditState implements ProfileEditState {
  factory _ProfileEditState({final Uint8List? uint8List, final User? user}) =
      _$_ProfileEditState;

  @override
  Uint8List? get uint8List;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileEditStateCopyWith<_$_ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
