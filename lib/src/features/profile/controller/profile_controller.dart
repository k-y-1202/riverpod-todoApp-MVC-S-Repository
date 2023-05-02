import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/user_service.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  build() {
    _userService = ref.read(userServiceProvider.notifier);
  }

  late UserService _userService;

  Future<User?> getUser() async {
    final currentUser = ref.watch(firebaseAuthProvider).currentUser!;
    return await _userService.getUser(userId: currentUser.uid);
  }
}
