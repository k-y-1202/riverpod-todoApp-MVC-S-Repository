import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String todoId, // todoID
    required String userId, // ユーザーID
    required String teamId, // チームID
    required String title, // タイトル
    required bool isDone, // 完了しているかどうか
    required String createdAt, // 作成日時
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
