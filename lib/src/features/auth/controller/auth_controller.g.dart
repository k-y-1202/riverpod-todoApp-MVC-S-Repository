// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authProviderHash() => r'611a9ffaccf14b004ed739cc4ce5028b3fdabd9c';

/// See also [authProvider].
@ProviderFor(authProvider)
final authProviderProvider =
    Provider<List<AuthProvider<AuthListener, AuthCredential>>>.internal(
  authProvider,
  name: r'authProviderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthProviderRef
    = ProviderRef<List<AuthProvider<AuthListener, AuthCredential>>>;
String _$authActionControllerHash() =>
    r'adc2d3835cc5b75578391ac7eb4b7b422c9ca632';

/// See also [AuthActionController].
@ProviderFor(AuthActionController)
final authActionControllerProvider =
    NotifierProvider<AuthActionController, AuthAction>.internal(
  AuthActionController.new,
  name: r'authActionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authActionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthActionController = Notifier<AuthAction>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
