// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInUpState {
  bool get isLoading => throw _privateConstructorUsedError;
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get passController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInUpStateCopyWith<SignInUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInUpStateCopyWith<$Res> {
  factory $SignInUpStateCopyWith(
          SignInUpState value, $Res Function(SignInUpState) then) =
      _$SignInUpStateCopyWithImpl<$Res, SignInUpState>;
  @useResult
  $Res call(
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passController});
}

/// @nodoc
class _$SignInUpStateCopyWithImpl<$Res, $Val extends SignInUpState>
    implements $SignInUpStateCopyWith<$Res> {
  _$SignInUpStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_SignInUpStateCopyWith<$Res>
    implements $SignInUpStateCopyWith<$Res> {
  factory _$$_SignInUpStateCopyWith(
          _$_SignInUpState value, $Res Function(_$_SignInUpState) then) =
      __$$_SignInUpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passController});
}

/// @nodoc
class __$$_SignInUpStateCopyWithImpl<$Res>
    extends _$SignInUpStateCopyWithImpl<$Res, _$_SignInUpState>
    implements _$$_SignInUpStateCopyWith<$Res> {
  __$$_SignInUpStateCopyWithImpl(
      _$_SignInUpState _value, $Res Function(_$_SignInUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? emailController = null,
    Object? passController = null,
  }) {
    return _then(_$_SignInUpState(
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

class _$_SignInUpState implements _SignInUpState {
  const _$_SignInUpState(
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
    return 'SignInUpState(isLoading: $isLoading, emailController: $emailController, passController: $passController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInUpState &&
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
  _$$_SignInUpStateCopyWith<_$_SignInUpState> get copyWith =>
      __$$_SignInUpStateCopyWithImpl<_$_SignInUpState>(this, _$identity);
}

abstract class _SignInUpState implements SignInUpState {
  const factory _SignInUpState(
      {final bool isLoading,
      required final TextEditingController emailController,
      required final TextEditingController passController}) = _$_SignInUpState;

  @override
  bool get isLoading;
  @override
  TextEditingController get emailController;
  @override
  TextEditingController get passController;
  @override
  @JsonKey(ignore: true)
  _$$_SignInUpStateCopyWith<_$_SignInUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
