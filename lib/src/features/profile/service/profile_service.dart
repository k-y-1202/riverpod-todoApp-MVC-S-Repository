import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';

part 'profile_service.g.dart';

@riverpod
ProfileService profileService(ProfileServiceRef ref) =>
    ProfileService(ref: ref);

class ProfileService {
  ProfileService({required this.ref});
  final Ref ref;

  Future<void> updateUserIcon(
      {required String userId, required String userIcon}) async {
    await ref
        .read(firebaseStorageProvider)
        .ref('userIcon/$userId')
        .putString(userIcon);
  }

  Future<File?> pickImage() async {
    if (kIsWeb) {
      return null;
    }
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    return (pickedImage != null) ? File(pickedImage.path) : null;
  }
}
