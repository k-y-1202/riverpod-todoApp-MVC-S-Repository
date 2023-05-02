import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';

part 'reset_pass_controller.g.dart';

@riverpod
class ResetPassController extends _$ResetPassController {
  ResetPassController() {
    _authService = ref.read(authServiceProvider.notifier);
  }

  @override
  bool build() {
    return false;
  }

  late AuthService _authService;

  Future<void> resetPass(String email) async {
    state = true;

    await _authService.resetPass(email);

    state = false;
  }

  void endProcess() {
    state = false;
  }
}
