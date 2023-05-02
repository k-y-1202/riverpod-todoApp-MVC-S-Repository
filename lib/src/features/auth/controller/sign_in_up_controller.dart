import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/state/sign_in_up_state.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';

part 'sign_in_up_controller.g.dart';

@riverpod
class SignInUpController extends _$SignInUpController {
  SignInUpController() {
    _authService = ref.read(authServiceProvider.notifier);
  }

  @override
  SignInUpState build() {
    return SignInUpState(
      isLoading: false,
      emailController: TextEditingController(),
      passController: TextEditingController(),
    );
  }

  late AuthService _authService;

  // ログイン・新規登録
  Future<void> signInUp({required bool isRegister}) async {
    state = state.copyWith(isLoading: true);

    final String email = state.emailController.text;
    final String pass = state.passController.text;
    state.emailController.clear();
    state.passController.clear();

    await _authService.signInUp(
      isRegister: isRegister,
      email: email,
      pass: pass,
    );

    state = state.copyWith(isLoading: false);
  }

  void endProcess() {
    state = state.copyWith(isLoading: false);
  }
}
