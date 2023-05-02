import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';

part 'todo_service.g.dart';

@riverpod
class TodoService extends _$TodoService {
  TodoService() {
    _todoRepo = ref.read(todoRepoProvider.notifier);
  }

  late TodoRepo _todoRepo;

  @override
  build() {}

  Future<void> addTodo({
    required String title,
  }) async =>
      await ref.read(todoRepoProvider).addTodo(
            title: title,
          );

  Future<void> changeToDone({
    required String todoId,
    required String title,
  }) async =>
      await ref.read(todoRepoProvider).updateTodo(
            isDone: true,
            title: title,
            todoId: todoId,
          );

  Future<void> editTodo({
    required String todoId,
    required String title,
    required bool isDone,
  }) async =>
      await ref.read(todoRepoProvider).updateTodo(
            todoId: todoId,
            title: title,
            isDone: isDone,
          );
}
