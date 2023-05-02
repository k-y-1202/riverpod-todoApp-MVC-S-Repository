import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/urls.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/controller/edit_profile_controller.dart';

class EditProfileScreen extends HookConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(editProfileControllerProvider.notifier);
    final state = ref.watch(editProfileControllerProvider);
    final deviceWidth = MediaQuery.of(context).size.width;
    final nameController = useTextEditingController();
    final user = useState<User?>(null);

    // ユーザー情報を取得する関数
    void getUser() async {
      final result = await controller.getUser();
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
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => controller.pickImage(),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: state.uint8List != null
                          ? Image.memory(state.uint8List!).image
                          : CachedNetworkImageProvider(
                              state.user?.userIcon ?? Urls.defaultIcon,
                            ),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorName.black,
                      foregroundColor: ColorName.white,
                      child: Icon(Icons.edit),
                    )
                  ],
                ),
              ),
            ),
            PaddingStyle.v32,
            PrimaryTextField(
              controller: nameController,
              title: '名前',
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              width: double.infinity,
              text: '確定する',
              onPressed: () {
                controller
                    .updateUser(
                      userId: user.value!.userId,
                      userName: nameController.text,
                      uint8list: state.uint8List,
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
