import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

part 'todo_list_controller.g.dart';

@riverpod
class TodoListController extends _$TodoListController {
  TodoListController() {
    _todoService = ref.read(todoServiceProvider.notifier);
  }
  @override
  build() {}

  late TodoService _todoService;

  Stream<List<Todo>> teamTodoList() {
    return _todoService.getTeamTodoList(teamId: "teamId");
  }

  Stream<List<Todo>> myTodoList() {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;
    return _todoService.getMyTodoList(userId: userId);
  }
}
