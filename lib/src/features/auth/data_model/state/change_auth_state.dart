import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_auth_state.freezed.dart';

@freezed
class ChangeAuthState with _$ChangeAuthState {
  const factory ChangeAuthState({
    @Default(false) bool isLoading,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) = _ChangeAuthState;
}
