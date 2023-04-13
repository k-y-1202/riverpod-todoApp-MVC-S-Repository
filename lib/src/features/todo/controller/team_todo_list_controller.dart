import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/state/team_todo_list_state.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';

part 'team_todo_list_controller.g.dart';

@riverpod
class TeamTodoListController extends _$TeamTodoListController {
  TeamTodoListController() : super() {
    Future(() async {
      state = state.copyWith(isLoading: true);
      // TODO: todoリストを取得する
      await Future.delayed(
        const Duration(seconds: 3),
      );
      state = state.copyWith(isLoading: false);
    });
  }

  @override
  TeamTodoListState build() {
    Todo todo = Todo(
      todoId: "todoId",
      userId: "userId",
      title: "title",
      isDone: false,
    );
    return TeamTodoListState(todoList: [todo, todo]);
  }
}
