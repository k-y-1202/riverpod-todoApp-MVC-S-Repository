import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
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

  Uint8List? uint8List;
  late UserService _userService;

  @override
  EditProfileState build() {
    _userService = ref.read(userServiceProvider.notifier);
    return EditProfileState();
  }

  Future<User?> getUser() async {
    final currentUser = ref.watch(firebaseAuthProvider).currentUser!;
    return await _userService.getUser(userId: currentUser.uid);
  }

  Future<void> updateUser({
    required String userId,
    required String userName,
    required Uint8List? uint8list,
  }) async {
    state = state.copyWith(isLoading: true);
    String? userIcon;

    final currentUser = ref.watch(firebaseAuthProvider).currentUser!;
    User? user = await _userService.getUser(userId: currentUser.uid);
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
