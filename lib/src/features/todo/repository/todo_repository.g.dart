// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoFirestoreHash() => r'56472f2138b7a39a61275987e66b1546b5ee0ba5';

/// See also [todoFirestore].
@ProviderFor(todoFirestore)
final todoFirestoreProvider =
    AutoDisposeProvider<CollectionReference<Todo>>.internal(
  todoFirestore,
  name: r'todoFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoFirestoreRef = AutoDisposeProviderRef<CollectionReference<Todo>>;
String _$todoRepoHash() => r'2c589d4a1ddce1408b3415c7dc50f2ca46a012fa';

/// See also [todoRepo].
@ProviderFor(todoRepo)
final todoRepoProvider = AutoDisposeProvider<TodoRepository>.internal(
  todoRepo,
  name: r'todoRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoRepoRef = AutoDisposeProviderRef<TodoRepository>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions