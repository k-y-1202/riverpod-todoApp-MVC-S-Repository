import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

part 'edit_todo_controller.g.dart';

@riverpod
class EditTodoController extends _$EditTodoController {
  EditTodoController() : super();

  @override
  FutureOr<void> build() {}

  Future<void> editTodo({
    required String todoId,
    required String title,
    required bool isDone,
  }) async {
    state = const AsyncLoading();
    await ref.read(todoServiceProvider.notifier).editTodo(
          todoId: todoId,
          title: title,
          isDone: isDone,
        );
  }
}
