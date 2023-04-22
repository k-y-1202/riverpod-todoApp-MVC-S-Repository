import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/controller/profile_edit_controller.dart';

class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileEditController =
        ref.read(profileEditControllerProvider.notifier);
    final deviceWidth = MediaQuery.of(context).size.width;
    final nameController = TextEditingController();
    final user = useState<User?>(null);

    // ユーザー情報を取得する関数
    void getUser() async {
      final result = await profileEditController.getUser();
      user.value = result;
      nameController.text = result!.userName;
    }

    // 初回build時に発火するHooksの関数
    useEffect(() {
      getUser();
      nameController.text = user.value?.userName ?? "";
      return null;
    });

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
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              width: double.infinity,
              text: '名前変更',
              onPressed: () {
                profileEditController
                    .updateUser(
                      userId: user.value!.userId,
                      userName: nameController.text,
                    )
                    .then((value) => context.go(AppPage.profile.toPath));
              },
            ),
          ],
        ),
      ),
    );
  }
}