// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInUp {
  bool get isLoading => throw _privateConstructorUsedError;
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get passController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInUpCopyWith<SignInUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInUpCopyWith<$Res> {
  factory $SignInUpCopyWith(SignInUp value, $Res Function(SignInUp) then) =
      _$SignInUpCopyWithImpl<$Res, SignInUp>;
  @useResult
  $Res call(
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passController});
}

/// @nodoc
class _$SignInUpCopyWithImpl<$Res, $Val extends SignInUp>
    implements $SignInUpCopyWith<$Res> {
  _$SignInUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? emailController = null,
    Object? passController = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passController: null == passController
          ? _value.passController
          : passController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInUpCopyWith<$Res> implements $SignInUpCopyWith<$Res> {
  factory _$$_SignInUpCopyWith(
          _$_SignInUp value, $Res Function(_$_SignInUp) then) =
      __$$_SignInUpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passController});
}

/// @nodoc
class __$$_SignInUpCopyWithImpl<$Res>
    extends _$SignInUpCopyWithImpl<$Res, _$_SignInUp>
    implements _$$_SignInUpCopyWith<$Res> {
  __$$_SignInUpCopyWithImpl(
      _$_SignInUp _value, $Res Function(_$_SignInUp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? emailController = null,
    Object? passController = null,
  }) {
    return _then(_$_SignInUp(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passController: null == passController
          ? _value.passController
          : passController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_SignInUp implements _SignInUp {
  const _$_SignInUp(
      {this.isLoading = false,
      required this.emailController,
      required this.passController});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController passController;

  @override
  String toString() {
    return 'SignInUp(isLoading: $isLoading, emailController: $emailController, passController: $passController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInUp &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passController, passController) ||
                other.passController == passController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, emailController, passController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInUpCopyWith<_$_SignInUp> get copyWith =>
      __$$_SignInUpCopyWithImpl<_$_SignInUp>(this, _$identity);
}

abstract class _SignInUp implements SignInUp {
  const factory _SignInUp(
      {final bool isLoading,
      required final TextEditingController emailController,
      required final TextEditingController passController}) = _$_SignInUp;

  @override
  bool get isLoading;
  @override
  TextEditingController get emailController;
  @override
  TextEditingController get passController;
  @override
  @JsonKey(ignore: true)
  _$$_SignInUpCopyWith<_$_SignInUp> get copyWith =>
      throw _privateConstructorUsedError;
}
