import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  factory EditProfileState({
    @Default(false) bool isLoading,
    Uint8List? uint8List,
    User? user,
  }) = _EditProfileState;
}
