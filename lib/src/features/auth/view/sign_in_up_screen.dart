import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/dialog/firebase_error.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/sign_in_up_controller.dart';

class SignInUpScreen extends ConsumerWidget {
  const SignInUpScreen({
    super.key,
    required this.isRegister,
  });

  final bool isRegister;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signInUpController = ref.watch(signInUpControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: signInUpController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Text(
                  isRegister ? "新規登録" : "- ログイン",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                PaddingStyle.v16,
                PrimaryTextField(
                  title: "メールアドレス",
                  controller: signInUpController.emailController,
                ),
                PaddingStyle.v8,
                PrimaryTextField(
                  title: "パスワード",
                  controller: signInUpController.passController,
                ),
                PaddingStyle.v16,
                PrimaryButton(
                  text: isRegister ? "新規登録" : "ログイン",
                  height: 40,
                  width: 420,
                  onPressed: () async =>
                      await _signInUp(context, ref, isRegister),
                ),
                PaddingStyle.v16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: ColorName.black),
                        children: [
                          const TextSpan(text: "パスワードを忘れた方は"),
                          TextSpan(
                            text: "こちら",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  // TODO: path
                                  () => context.go("APP_PAGE.resetPass.toPath"),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: ColorName.black),
                        children: [
                          TextSpan(text: isRegister ? "ログインは" : "新規アカウント作成は"),
                          TextSpan(
                            text: "こちら",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.go(
                                    // TODO: path
                                    isRegister
                                        ? "APP_PAGE.login.toPath"
                                        : "APP_PAGE.signUp.toPath",
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Future<void> _signInUp(
      BuildContext context, WidgetRef ref, isRegister) async {
    final signInUpController = ref.read(signInUpControllerProvider.notifier);
    try {
      await signInUpController.signInUp(isRegister: isRegister);
    } on FirebaseAuthException catch (e) {
      EM.firebaseAuth(context, e.code);
    } catch (e) {
      EM.firebaseAuth(context, "error");
    }
    signInUpController.endProcess();
  }
}
