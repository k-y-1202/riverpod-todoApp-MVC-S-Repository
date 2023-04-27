import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
List<AuthProvider<AuthListener, AuthCredential>> authProvider(
    AuthProviderRef ref) {
  return [
    EmailAuthProvider(),
  ];
}

@Riverpod(keepAlive: true)
class AuthActionController extends _$AuthActionController {
  @override
  AuthAction build() {
    return AuthAction.signIn;
  }

  changeAuthAction() {
    if (state == AuthAction.signIn) {
      state = AuthAction.signUp;
    } else {
      state = AuthAction.signIn;
    }
  }
}
