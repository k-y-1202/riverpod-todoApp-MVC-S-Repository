import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/user_service.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/data_model/state/edit_profile_state.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  EditProfileController() {
    Future(() async {
      state = state.copyWith(isLoading: true);
      final user = await getUser();
      state = state.copyWith(user: user);
      state = state.copyWith(isLoading: false);
    });
  }

  User get currentUser => ref.watch(authServiceProvider.notifier).currentUser!;
  Uint8List? uint8List;
  late UserService _userService;

  @override
  EditProfileState build() {
    _userService = ref.read(userServiceProvider.notifier);
    return EditProfileState();
  }

  Future<User?> getUser() async =>
      await _userService.getUser(userId: currentUser.userId);

  Future<void> updateUser({
    required String userId,
    required String userName,
    required Uint8List? uint8list,
  }) async {
    state = state.copyWith(isLoading: true);
    String? userIcon;

    User user = currentUser;
    user = user.copyWith(userName: userName);

    if (uint8List != null) {
      userIcon = await _userService.updateUserIcon(
        userId: userId,
        uint8List: uint8List!,
      );
      user = user.copyWith(userIcon: userIcon);
    }
    await _userService.updateUser(user: user);

    state = state.copyWith(isLoading: false);
  }

  Future<void> pickImage() async {
    state = state.copyWith(isLoading: true);
    uint8List = await _userService.pickImage();
    if (uint8List != null) {
      state = state.copyWith(uint8List: uint8List);
    }
    state = state.copyWith(isLoading: false);
  }
}
