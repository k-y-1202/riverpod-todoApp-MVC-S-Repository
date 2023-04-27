import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  build() async {
    return await getUser();
  }

  Future<User?> getUser() async {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;
    return await ref.read(userRepoProvider).getUser(userId: userId);
  }
}
