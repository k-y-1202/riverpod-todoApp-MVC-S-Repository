import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/urls.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  AuthService() {
    _auth = ref.read(firebaseAuthProvider);
    _userRepo = ref.read(userRepoProvider.notifier);
  }

  late auth.FirebaseAuth _auth;
  late UserRepo _userRepo;

  @override
  build() {}

  // ログイン・新規登録
  Future<void> signInUp({
    required bool isRegister,
    required String email,
    required String pass,
  }) async {
    isRegister
        ? await _auth.createUserWithEmailAndPassword(
            email: email,
            password: pass,
          )
        : await _auth.signInWithEmailAndPassword(
            email: email,
            password: pass,
          );
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      final isUserExistedInDb = await _userRepo.searchUserById(
        userId: firebaseUser.uid,
      );
      if (!isUserExistedInDb) {
        await _userRepo.addUser(user: _convertToUser(firebaseUser));
      }
    }
  }

  User _convertToUser(auth.User firebaseUser) {
    return User(
      userId: firebaseUser.uid,
      userName: firebaseUser.displayName ?? "",
      userIcon: Urls.defaultIcon,
      email: firebaseUser.email ?? "",
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  // メールアドレス変更
  Future<void> changeEmail(String email) async {
    // ユーザー情報を取得
    final firebaseUser = _auth.currentUser;
    User? user =
        await ref.read(userRepoProvider).getUser(userId: firebaseUser!.uid);
    if (user == null) return;

    await _auth.currentUser?.updateEmail(email);

    // ユーザー情報を更新
    user = user.copyWith(email: email);
    ref.read(userRepoProvider).updateUser(user: user);
  }

  // パスワード変更
  Future<void> changePass(String pass) async {
    await _auth.currentUser?.updatePassword(pass);
  }

  // パスワードリセット
  Future<void> resetPass(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
