import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';

class ProfileEditScreen extends ConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final nameController = TextEditingController();
    final user = ref.read(firebaseAuthProvider).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryTextField(
              controller: nameController,
              title: '名前',
              hintText: '山田太郎',
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              width: double.infinity,
              text: '名前変更',
              onPressed: () {
                // TODO: controllerを使う
                final repo = ref.read(userRepoProvider);
                repo.updateUser(
                  userId: user!.uid,
                  userName: nameController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
