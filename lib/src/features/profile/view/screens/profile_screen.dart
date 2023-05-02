import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/urls.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/controller/profile_controller.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final user = useState<User?>(null); // HooksのStateを使ってユーザー情報を管理

    // ユーザー情報を取得する関数
    void getUser() async {
      final profileDetailsController =
          ref.read(profileControllerProvider.notifier);
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
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: CachedNetworkImageProvider(
                  user.value?.userIcon ?? Urls.defaultIcon,
                ),
              ),
            ),
            PaddingStyle.v32,
            Text('name : ${user.value?.userName ?? ''}'),
            const SizedBox(height: 24),
            Text('email : ${user.value?.email ?? ''}'),
            const SizedBox(height: 48),
            PrimaryButton(
              width: double.infinity,
              text: 'プロフィール編集',
              onPressed: () => context.go(AppPage.editProfile.toPath),
            ),
            PaddingStyle.v32,
            PrimaryButton(
              width: double.infinity,
              text: 'メルアド変更',
              onPressed: () => context.go(AppPage.changeEmail.toPath),
            ),
            PaddingStyle.v16,
            PrimaryButton(
              width: double.infinity,
              text: 'パスワード変更',
              onPressed: () => context.go(AppPage.changePass.toPath),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
