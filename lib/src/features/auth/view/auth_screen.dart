import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/auth_controller.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/view/components/custom_email_form.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAction = ref.watch(authActionControllerProvider);
    return Scaffold(
      body: AuthFlowBuilder<EmailAuthController>(
        action: authAction, // ここに入れる値でログインかサインアップかを切り替える
        onComplete: (credential) => context.go(AppPage.teamTodoList.toPath),
        builder: (context, state, ctrl, child) {
          if (state is AwaitingEmailAndPassword) {
            return const CustomEmailForm();
          } else if (state is SigningIn) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SigningUp) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthFailed) {
            // TODO: エラー処理を書く
            return ErrorText(exception: state.exception);
          } else {
            return Text('Unknown state $state');
          }
        },
      ),
    );
  }
}
