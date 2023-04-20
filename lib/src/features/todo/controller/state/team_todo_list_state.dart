import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';

part 'team_todo_list_state.freezed.dart';

@freezed
class TeamTodoListState with _$TeamTodoListState {
  const factory TeamTodoListState({
    @Default([]) List<Todo> todoList, // todoリスト
  }) = _TeamTodoListState;
}
