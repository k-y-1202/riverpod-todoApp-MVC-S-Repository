import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
class UserRepo extends _$UserRepo {
  late CollectionReference<User> _db;

  @override
  build() {
    _db = ref.read(userFirestoreProvider);
  }

  // create
  Future<void> addUser({required User user}) async =>
      await _db.doc(user.userId).set(user);

  // update
  Future<void> updateUser({required User user}) async =>
      await _db.doc(user.userId).update(user.toJson());

  // read
  Future<User?> getUser({required String userId}) async =>
      await _db.doc(userId).get().then((doc) => doc.data());

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
