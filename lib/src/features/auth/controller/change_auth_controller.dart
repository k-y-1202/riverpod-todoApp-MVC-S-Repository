import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/state/change_auth_state.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';

part 'change_auth_controller.g.dart';

@riverpod
class ChangeAuthController extends _$ChangeAuthController {
  ChangeAuthController() {
    _authService = ref.read(authServiceProvider.notifier);
  }

  @override
  ChangeAuthState build() {
    return ChangeAuthState(
      isLoading: false,
      emailController: TextEditingController(),
      passController: TextEditingController(),
    );
  }

  late AuthService _authService;

  Future<void> changeEmail() async {
    state = state.copyWith(isLoading: true);

    final String email = state.emailController.text;
    if (email == '') return;
    state.emailController.clear();

    await _authService.changeEmail(email);

    state = state.copyWith(isLoading: false);
  }

  Future<void> changePass() async {
    state = state.copyWith(isLoading: true);

    final String pass = state.passController.text;
    state.passController.clear();

    await _authService.changePass(pass);

    state = state.copyWith(isLoading: false);
  }

  void endProcess() {}
}
