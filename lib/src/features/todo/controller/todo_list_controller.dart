import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';

part 'todo_list_controller.g.dart';

@riverpod
class TodoListController extends _$TodoListController {
  @override
  build() {}

  Stream<List<Todo>> teamTodoList() {
    return ref.read(todoRepoProvider).getTeamTodoList(teamId: "teamId");
  }

  Stream<List<Todo>> myTodoList() {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;
    return ref.read(todoRepoProvider).getMyTodoList(userId: userId);
  }
}
