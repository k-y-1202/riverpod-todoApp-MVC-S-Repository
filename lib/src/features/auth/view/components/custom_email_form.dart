import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/auth_controller.dart';

class CustomEmailForm extends ConsumerWidget {
  const CustomEmailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAction = ref.read(authActionControllerProvider);
    final ctrl = AuthController.ofType<EmailAuthController>(context);
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: passController,
          decoration: const InputDecoration(
            labelText: 'Pass',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ctrl.setEmailAndPassword(emailController.text, passController.text);
          },
          child: Text(authAction == AuthAction.signIn ? 'Sign in' : 'Sign up'),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('パスワードを忘れた'),
            ),
            TextButton(
              onPressed: () {
                final authActionNotifier =
                    ref.read(authActionControllerProvider.notifier);
                authActionNotifier.changeAuthAction();
              },
              child:
                  Text(authAction == AuthAction.signIn ? 'アカウントを作成' : 'ログイン'),
            ),
          ],
        ),
      ],
    );
  }
}
