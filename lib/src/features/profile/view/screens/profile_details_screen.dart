import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/controller/profile_details_controller.dart';

class ProfileDetailsScreen extends HookConsumerWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final user = useState<User?>(null); // HooksのStateを使ってユーザー情報を管理

    // ユーザー情報を取得する関数
    void getUser() async {
      final profileDetailsController =
          ref.read(profileDetailsControllerProvider.notifier);
      final result = await profileDetailsController.getUser();
      user.value = result;
    }

    // 初回build時に発火するHooksの関数
    useEffect(() {
      getUser();
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ref.read(firebaseAuthProvider).signOut().then((_) {
                    context.go(AppPage.login.toPath);
                  });
                },
                child: const Text('ログアウト'),
              ),
            ),
            const Spacer(),
            Text('name : ${user.value?.userName ?? ''}'),
            const SizedBox(height: 24),
            Text('email : ${user.value?.email ?? ''}'),
            const SizedBox(height: 48),
            PrimaryButton(
              width: double.infinity,
              text: 'プロフィール編集',
              onPressed: () => context.go(AppPage.editProfile.toPath),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
