import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/dialog/firebase_error.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
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
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(isRegister ? "新規登録" : "ログイン"),
      ),
      body: signInUpController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    onPressed: () async =>
                        await _signInUp(context, ref, isRegister),
                  ),
                  PaddingStyle.v16,
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: ColorName.black),
                        children: [
                          TextSpan(text: isRegister ? "ログインは" : "新規アカウント作成は"),
                          TextSpan(
                            text: "こちら",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.go(
                                    isRegister
                                        ? AppPage.login.toPath
                                        : AppPage.register.toPath,
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
