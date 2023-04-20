import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/keys.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';

final todoFirestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance
      .collection(Keys.todoCollection)
      .withConverter(
        fromFirestore: (snapshot, options) => Todo.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
});

final todoRepoProvider = Provider<TodoRepository>((ref) {
  return TodoRepository(ref: ref);
});

class TodoRepository {
  TodoRepository({required this.ref}) : _db = ref.read(todoFirestoreProvider);
  final Ref ref;
  final CollectionReference _db;

  // create
  Future<void> addTodo({
    required String title,
  }) async {
    final doc = _db.doc();
    final user = ref.watch(firebaseAuthProvider).currentUser;
    final todo = Todo(
      title: title,
      createdAt: DateTime.now().toIso8601String(),
      userId: user!.uid,
      isDone: false,
      todoId: '',
    );
    await doc.set(todo.copyWith(todoId: doc.id));
  }

  // update
  Future<void> updateTodo({
    required String todoId,
    required bool isDone,
  }) async {
    await _db.doc(todoId).update({'isDone': isDone});
  }

  // read
  Stream<List<Todo>> getMyTodoList({required String userId}) {
    return queryTodo().where(userId, isEqualTo: Keys.userId).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  Stream<List<Todo>> getTeamTodoList({required String teamId}) {
    return queryTodo().where(teamId, isEqualTo: Keys.teamId).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  Query<Todo> queryTodo() {
    Query<Todo> query = _db.withConverter(
      fromFirestore: (snapshot, options) => Todo.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
    return query;
  }
}
