import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/keys.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';

part 'user_repository.g.dart';

@riverpod
CollectionReference<User> userFirestore(UserFirestoreRef ref) {
  return ref
      .read(firestoreProvider)
      .collection(Keys.userCollection)
      .withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (value, _) => value.toJson(),
      );
}

@riverpod
UserRepository userRepo(UserRepoRef ref) => UserRepository(ref: ref);

class UserRepository {
  UserRepository({required this.ref}) : _db = ref.read(userFirestoreProvider);
  final Ref ref;
  final CollectionReference<User> _db;

  // create
  Future<void> addUser({required User user}) async =>
      await _db.doc(user.userId).set(user);

  // update
  Future<void> updateUser({required User user}) async =>
      await _db.doc(user.userId).update(user.toJson());

  // read
  Future<User?> getUser({required String userId}) async =>
      await _db.doc(userId).get().then((doc) => doc.data());

  Future<bool> searchUser({required String userId}) async {
    final user = await _db.where(Keys.userId, isEqualTo: userId).get();
    return user.docs.isNotEmpty;
  }

  // search
  Future<bool> searchUserById({required String userId}) async =>
      await _db.where(Keys.userId, isEqualTo: userId).get().then((doc) {
        if (doc.docs.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      });
}
