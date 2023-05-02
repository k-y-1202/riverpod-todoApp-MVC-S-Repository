import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/pick/pick_export.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';

part 'user_service.g.dart';

@riverpod
class UserService extends _$UserService {
  UserService();

  @override
  build() {
    return null;
  }

  Future<void> addUser(User user) async =>
      await ref.read(userRepoProvider).addUser(user: user);

  Future<User?> getUser({required String userId}) async =>
      await ref.read(userRepoProvider).getUser(userId: userId);

  Future<void> updateUser({required User user}) async =>
      await ref.read(userRepoProvider).updateUser(user: user);

  Future<String> updateUserIcon(
          {required String userId, required Uint8List uint8List}) async =>
      ref
          .read(firebaseStorageProvider)
          .ref('userIcon/$userId')
          .putData(uint8List, SettableMetadata(contentType: 'image/png'))
          .then(
            (value) => (value.ref.getDownloadURL()),
          );

  // pick_export.dartのpickFile()を呼び出す
  Future<Uint8List?> pickImage() async => await Pick().pickFile();
}
