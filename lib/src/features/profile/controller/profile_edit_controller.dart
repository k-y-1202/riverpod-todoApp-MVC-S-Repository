import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/data_model/profile_edit_state.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/service/profile_service.dart';

part 'profile_edit_controller.g.dart';

@riverpod
class ProfileEditController extends _$ProfileEditController {
  Uint8List? uint8List;

  @override
  Future<ProfileEditState> build() async {
    return ProfileEditState(
      uint8List: uint8List,
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
    required Uint8List? uint8list,
  }) async {
    String? userIcon;
    User? user = await ref.read(userRepoProvider).getUser(userId: userId);
    if (user == null) return;

    user = user.copyWith(userName: userName);

    if (uint8List != null) {
      userIcon = await ref.read(profileServiceProvider).updateUserIcon(
            userId: userId,
            uint8List: uint8List!,
          );
      user = user.copyWith(userIcon: userIcon);
    }

    await ref.read(userRepoProvider).updateUser(user: user);
  }

  Future<void> pickImage() async {
    uint8List = await ref.read(profileServiceProvider).pickImage();
    if (uint8List != null) {
      state = AsyncValue.data(state.value!.copyWith(uint8List: uint8List!));
    }
  }
}
