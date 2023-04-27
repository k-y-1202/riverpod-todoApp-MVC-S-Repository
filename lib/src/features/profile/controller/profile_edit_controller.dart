import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';

part 'profile_edit_controller.g.dart';

@riverpod
class ProfileEditController extends _$ProfileEditController {
  @override
  build() {}

  Future<User?> getUser() async {
    final userId = ref.read(authRepositoryProvider).currentUser!.uid;
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
}
