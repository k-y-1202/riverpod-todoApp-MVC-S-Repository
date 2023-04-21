import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';

part 'profile_details_controller.g.dart';

@riverpod
class ProfileDetailsController extends _$ProfileDetailsController {
  @override
  build() {}

  Future<User?> getUser() async {
    final userId = ref.read(authRepositoryProvider).currentUser!.uid;
    return await ref.read(userRepoProvider).getUser(userId: userId);
  }
}
