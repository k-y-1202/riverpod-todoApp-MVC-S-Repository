import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';

part 'add_todo_controller.g.dart';

@riverpod
class AddTodoController extends _$AddTodoController {
  AddTodoController() : super();

  @override
  FutureOr<void> build() {}

  void addTodo(String title) async {
    state = const AsyncLoading();
    await ref.read(todoRepoProvider).addTodo(title: title);
    state = const AsyncData(null);
  }
}
