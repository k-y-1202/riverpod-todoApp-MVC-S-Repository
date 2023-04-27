import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/sign_in_up.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/sign_in_up_service.dart';

part 'sign_in_up_controller.g.dart';

@riverpod
class SignInUpController extends _$SignInUpController {
  SignInUpController() : super();

  @override
  SignInUp build() {
    return SignInUp(
      isLoading: false,
      emailController: TextEditingController(),
      passController: TextEditingController(),
    );
  }

  // ログイン・新規登録
  Future<void> signInUp({required bool isRegister}) async {
    state = state.copyWith(isLoading: true);

    final String email = state.emailController.text;
    final String pass = state.passController.text;
    state.emailController.clear();
    state.passController.clear();

    await ref.read(signInUpServiceProvider).signInUp(
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
