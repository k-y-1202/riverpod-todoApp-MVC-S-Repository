import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

part 'edit_todo_controller.g.dart';

@riverpod
class EditTodoController extends _$EditTodoController {
  @override
  bool build() {
    _todoService = ref.read(todoServiceProvider.notifier);
    return false;
  }

  late TodoService _todoService;

  Future<void> editTodo({
    required String todoId,
    required String title,
    required bool isDone,
  }) async {
    state = true;
    await _todoService.editTodo(
      todoId: todoId,
      title: title,
      isDone: isDone,
    );
    state = false;
  }

  Future<Todo?> getTodoById({required String todoId}) async {
    return await _todoService.getTodoById(todoId: todoId);
  }
}
