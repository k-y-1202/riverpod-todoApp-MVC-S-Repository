import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/user_service.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  ProfileController() {
    _auth = ref.read(firebaseAuthProvider);
    _userService = ref.read(userServiceProvider.notifier);
  }
  @override
  build() async {
    return await getUser();
  }

  late auth.FirebaseAuth _auth;
  late UserService _userService;

  Future<User?> getUser() async {
    final userId = _auth.currentUser!.uid;
    return await _userService.getUser(userId: userId);
  }
}
