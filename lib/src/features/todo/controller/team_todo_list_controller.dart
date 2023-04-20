import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';

part 'team_todo_list_controller.g.dart';

@riverpod
class TeamTodoListController extends _$TeamTodoListController {
  @override
  build() {}

  Stream<List<Todo>> teamTodoList() {
    return ref.read(todoRepoProvider).getTeamTodoList(teamId: "teamId");
  }
}
