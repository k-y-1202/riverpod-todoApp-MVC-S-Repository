import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/keys.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';

final userFirestoreProvider = Provider<CollectionReference<User>>(
  (ref) => ref
      .read(firestoreProvider)
      .collection(Keys.userCollection)
      .withConverter(
        fromFirestore: (snapshot, options) => User.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      ),
);

final userRepoProvider = Provider<UserRepository>(
  (ref) => UserRepository(ref: ref),
);

class UserRepository {
  UserRepository({required this.ref}) : _db = ref.read(userFirestoreProvider);
  final Ref ref;
  final CollectionReference<User> _db;

  // create
  Future<void> addUser({
    required String userId,
    required String userName,
    required String email,
  }) async {
    final doc = _db.doc(userId);
    final user = User(
      userName: userName,
      userId: userId,
      email: email,
      createdAt: DateTime.now().toIso8601String(),
    );
    await doc.set(user);
  }

  // update
  Future<void> updateUser({
    required String userId,
    required String userName,
  }) async =>
      await _db.doc(userId).update({'userName': userName});

  // read
  Future<User?> getUser({required String userId}) async =>
      await _db.doc(userId).get().then((doc) => doc.data());

  Future<bool> searchUser({required String userId}) async {
    final user = await _db.where(Keys.userId, isEqualTo: userId).get();
    return user.docs.isNotEmpty;
  }
}
