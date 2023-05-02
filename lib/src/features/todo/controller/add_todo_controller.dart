import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

part 'add_todo_controller.g.dart';

@riverpod
class AddTodoController extends _$AddTodoController {
  @override
  bool build() {
    _todoService = ref.read(todoServiceProvider.notifier);
    return false;
  }

  late TodoService _todoService;

  Future<void> addTodo(String title) async {
    state = true;
    await _todoService.addTodo(title: title);
    state = false;
  }
}
