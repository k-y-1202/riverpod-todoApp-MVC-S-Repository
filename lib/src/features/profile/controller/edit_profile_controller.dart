import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/user_service.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/data_model/state/edit_profile_state.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class ProfileEditController extends _$ProfileEditController {
  Uint8List? uint8List;
  late UserService _userService;
  late auth.FirebaseAuth _auth;

  @override
  Future<EditProfileState> build() async {
    _userService = ref.read(userServiceProvider.notifier);
    _auth = ref.read(firebaseAuthProvider);
    return EditProfileState(
      uint8List: uint8List,
      user: await getUser(),
    );
  }

  Future<User?> getUser() async {
    final userId = _auth.currentUser!.uid;
    return await _userService.getUser(userId: userId);
  }

  Future<void> updateUser({
    required String userId,
    required String userName,
    required Uint8List? uint8list,
  }) async {
    String? userIcon;
    User? user = await _userService.getUser(userId: userId);
    if (user == null) return;

    user = user.copyWith(userName: userName);

    if (uint8List != null) {
      userIcon = await _userService.updateUserIcon(
        userId: userId,
        uint8List: uint8List!,
      );
      user = user.copyWith(userIcon: userIcon);
    }

    await _userService.updateUser(user: user);
  }

  Future<void> pickImage() async {
    uint8List = await _userService.pickImage();
    if (uint8List != null) {
      state = AsyncValue.data(state.value!.copyWith(uint8List: uint8List!));
    }
  }
}
