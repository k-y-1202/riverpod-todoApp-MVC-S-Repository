import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/data_model/profile_edit_state.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/service/profile_service.dart';

part 'profile_edit_controller.g.dart';

@riverpod
class ProfileEditController extends _$ProfileEditController {
  File? imageFile;

  @override
  Future<ProfileEditState> build() async {
    return ProfileEditState(
      imageFile: imageFile,
      user: await getUser(),
    );
  }

  Future<User?> getUser() async {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;
    return await ref.read(userRepoProvider).getUser(userId: userId);
  }

  Future<void> updateUser({
    required String userId,
    required String userName,
  }) async {
    await ref.read(userRepoProvider).updateUser(
          userId: userId,
          userName: userName,
        );
  }

  Future<void> pickImage() async {
    imageFile = await ref.read(profileServiceProvider).pickImage();
    if (imageFile != null) {
      state = AsyncValue.data(state.value!.copyWith(imageFile: imageFile));
    }
  }
}
