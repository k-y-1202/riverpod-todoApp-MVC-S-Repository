import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/auth_controller.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: SignInScreen(
        providers: authProvider,
      ),
    );
  }
}
