import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';

part 'todo_service.g.dart';

@riverpod
class TodoService extends _$TodoService {
  late TodoRepo _todoRepo;

  @override
  build() {
    _todoRepo = ref.read(todoRepoProvider.notifier);
  }

  Future<void> addTodo({
    required String title,
  }) async =>
      await _todoRepo.addTodo(
        title: title,
      );

  Future<void> changeToDone({
    required String todoId,
    required String title,
  }) async =>
      await _todoRepo.updateTodo(
        isDone: true,
        title: title,
        todoId: todoId,
      );

  Future<void> editTodo({
    required String todoId,
    required String title,
    required bool isDone,
  }) async =>
      await _todoRepo.updateTodo(
        todoId: todoId,
        title: title,
        isDone: isDone,
      );

  Stream<List<Todo>> getMyTodoList({required String userId}) =>
      _todoRepo.getMyTodoList(userId: userId);

  Stream<List<Todo>> getTeamTodoList({required String teamId}) =>
      _todoRepo.getTeamTodoList(teamId: teamId);

  Future<Todo?> getTodoById({required String todoId}) async {
    return await _todoRepo.getTodoById(todoId: todoId);
  }
}
