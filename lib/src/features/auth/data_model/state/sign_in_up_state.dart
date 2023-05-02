import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_up_state.freezed.dart';

@freezed
class SignInUpState with _$SignInUpState {
  const factory SignInUpState({
    @Default(false) bool isLoading,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) = _SignInUpState;
}
