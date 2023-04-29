import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/pick/pick_export.dart';

part 'profile_service.g.dart';

@riverpod
ProfileService profileService(ProfileServiceRef ref) =>
    ProfileService(ref: ref);

class ProfileService {
  ProfileService({required this.ref});
  final Ref ref;

  Future<String> updateUserIcon(
      {required String userId, required Uint8List uint8List}) async {
    return ref
        .read(firebaseStorageProvider)
        .ref('userIcon/$userId')
        .putData(uint8List, SettableMetadata(contentType: 'image/png'))
        .then((value) => (value.ref.getDownloadURL()));
  }

  Future<Uint8List?> pickImage() async {
    return await Pick().pickFile();
  }
}
