// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  Uint8List? get uint8List => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call({bool isLoading, Uint8List? uint8List, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? uint8List = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$_EditProfileStateCopyWith(
          _$_EditProfileState value, $Res Function(_$_EditProfileState) then) =
      __$$_EditProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Uint8List? uint8List, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$_EditProfileState>
    implements _$$_EditProfileStateCopyWith<$Res> {
  __$$_EditProfileStateCopyWithImpl(
      _$_EditProfileState _value, $Res Function(_$_EditProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? uint8List = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_EditProfileState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$_EditProfileState implements _EditProfileState {
  _$_EditProfileState({this.isLoading = false, this.uint8List, this.user});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Uint8List? uint8List;
  @override
  final User? user;

  @override
  String toString() {
    return 'EditProfileState(isLoading: $isLoading, uint8List: $uint8List, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.uint8List, uint8List) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(uint8List), user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      __$$_EditProfileStateCopyWithImpl<_$_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  factory _EditProfileState(
      {final bool isLoading,
      final Uint8List? uint8List,
      final User? user}) = _$_EditProfileState;

  @override
  bool get isLoading;
  @override
  Uint8List? get uint8List;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
