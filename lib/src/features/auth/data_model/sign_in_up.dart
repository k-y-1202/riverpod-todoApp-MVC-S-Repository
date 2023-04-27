import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_up.freezed.dart';

@freezed
class SignInUp with _$SignInUp {
  const factory SignInUp({
    @Default(false) bool isLoading,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) = _SignInUp;
}
