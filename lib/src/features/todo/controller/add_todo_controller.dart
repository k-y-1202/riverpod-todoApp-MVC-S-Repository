import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

part 'add_todo_controller.g.dart';

@riverpod
class AddTodoController extends _$AddTodoController {
  AddTodoController() {
    _todoService = ref.read(todoServiceProvider.notifier);
  }

  @override
  FutureOr<void> build() {}

  late TodoService _todoService;

  Future<void> addTodo(String title) async {
    state = const AsyncLoading();
    await _todoService.addTodo(title: title);
    state = const AsyncData(null);
  }
}
