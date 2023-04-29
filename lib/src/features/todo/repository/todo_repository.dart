import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/keys.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';

part 'todo_repository.g.dart';

// withConverter
@riverpod
CollectionReference<Todo> todoFirestore(TodoFirestoreRef ref) {
  return ref
      .read(firestoreProvider)
      .collection(Keys.todoCollection)
      .withConverter(
        fromFirestore: (snapshot, options) => Todo.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

@riverpod
TodoRepository todoRepo(TodoRepoRef ref) => TodoRepository(ref: ref);

class TodoRepository {
  TodoRepository({required this.ref}) : _db = ref.read(todoFirestoreProvider);
  final Ref ref;
  final CollectionReference<Todo> _db;

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
      teamId: 'teamId',
      isDone: false,
      todoId: doc.id,
    );
    await doc.set(todo);
  }

  // update
  Future<void> updateTodo({
    required String todoId,
    required bool isDone,
    required String title,
  }) async =>
      await _db.doc(todoId).update(
        {Keys.isDone: isDone, Keys.title: title},
      );

  // read
  // 自分だけのTodoを取得
  Stream<List<Todo>> getMyTodoList({required String userId}) =>
      _db.where(Keys.userId, isEqualTo: userId).snapshots().map(
            (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
          );

  // チームのTodoを取得
  Stream<List<Todo>> getTeamTodoList({required String teamId}) =>
      _db.where(Keys.teamId, isEqualTo: teamId).snapshots().map(
            (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
          );
}
