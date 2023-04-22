import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/model/todo.dart';
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
    final userId = ref.read(authRepositoryProvider).currentUser!.uid;
    return ref.read(todoRepoProvider).getMyTodoList(userId: userId);
  }
}
