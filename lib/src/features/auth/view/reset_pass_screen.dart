import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/dialog/firebase_error.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/reset_pass_controller.dart';

class ResetPassScreen extends HookConsumerWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(resetPassControllerProvider);
    final emailController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("パスワード再設定"),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Container(
                width: 600,
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryTextField(
                      title: "メールアドレス",
                      controller: emailController,
                    ),
                    PaddingStyle.v16,
                    PaddingStyle.v16,
                    PrimaryButton(
                      text: "再設定",
                      height: 40,
                      width: 420,
                      onPressed: () async =>
                          await _resetPass(context, ref, emailController.text),
                    ),
                    PaddingStyle.v16,
                    PaddingStyle.v16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: ColorName.black),
                            children: [
                              const TextSpan(text: "ログインは"),
                              TextSpan(
                                text: "こちら",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => context.go(AppPage.login.toPath),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: ColorName.black),
                            children: [
                              const TextSpan(text: "新規アカウント作成は"),
                              TextSpan(
                                text: "こちら",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.go(
                                        AppPage.register.toPath,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  _resetPass(BuildContext context, WidgetRef ref, String email) async {
    final controller = ref.read(resetPassControllerProvider.notifier);

    try {
      await controller.resetPass(email).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('パスワード再設定メールを送信しました。'),
          ),
        );
        context.go(AppPage.login.toPath);
      });
    } on FirebaseAuthException catch (e) {
      EM.firebaseAuth(context, e.code);
    } catch (e) {
      EM.firebaseAuth(context, "error");
    }
    controller.endProcess();
  }
}
