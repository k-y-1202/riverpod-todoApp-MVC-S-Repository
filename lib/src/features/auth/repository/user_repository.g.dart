// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFirestoreHash() => r'afe55a12c13e405e716c879ccb4dea249ffef366';

/// See also [userFirestore].
@ProviderFor(userFirestore)
final userFirestoreProvider =
    AutoDisposeProvider<CollectionReference<User>>.internal(
  userFirestore,
  name: r'userFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserFirestoreRef = AutoDisposeProviderRef<CollectionReference<User>>;
String _$userRepoHash() => r'b10317a8daf27d7e9df8a02ec748c93f5107e6fb';

/// See also [UserRepo].
@ProviderFor(UserRepo)
final userRepoProvider =
    AutoDisposeNotifierProvider<UserRepo, dynamic>.internal(
  UserRepo.new,
  name: r'userRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRepo = AutoDisposeNotifier<dynamic>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
