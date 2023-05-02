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
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/change_auth_controller.dart';

class ChangeAuthScreen extends ConsumerWidget {
  const ChangeAuthScreen({
    super.key,
    required this.isEmail,
  });

  final bool isEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(changeAuthControllerProvider);

    return Scaffold(
      body: Center(
        child: state.isLoading
            ? const CircularProgressIndicator()
            : Container(
                width: 600,
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isEmail ? "メールアドレス変更" : "パスワード変更",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    PaddingStyle.v16,
                    isEmail
                        ? PrimaryTextField(
                            title: "メールアドレス",
                            controller: state.emailController,
                          )
                        : PrimaryTextField(
                            title: "パスワード",
                            controller: state.passController,
                          ),
                    PaddingStyle.v32,
                    PrimaryButton(
                      text: isEmail ? 'メールアドレスを変更する' : 'パスワードを変更する',
                      height: 40,
                      width: 420,
                      onPressed: () async =>
                          await _resetAuth(context, ref, isEmail),
                    ),
                    PaddingStyle.v32,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '戻る',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      context.go(AppPage.editProfile.toPath),
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

  Future<void> _resetAuth(
      BuildContext context, WidgetRef ref, bool isEmail) async {
    final controller = ref.read(changeAuthControllerProvider.notifier);
    try {
      if (isEmail) {
        await controller.changeEmail();
        context.go(AppPage.teamTodoList.toPath);
      } else {
        await controller.changePass();
        context.go(AppPage.teamTodoList.toPath);
      }
    } on FirebaseAuthException catch (e) {
      EM.firebaseAuth(context, e.code);
    } catch (e) {
      EM.firebaseAuth(context, "error");
    }
    controller.endProcess();
  }
}
