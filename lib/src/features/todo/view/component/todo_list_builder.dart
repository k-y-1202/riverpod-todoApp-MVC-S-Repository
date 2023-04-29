import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/component/todo_tile.dart';

class TodoListBuilder extends ConsumerWidget {
  const TodoListBuilder({
    super.key,
    required this.stream,
  });

  final Stream<List<Todo>> stream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.read(firebaseAuthProvider);
    final currentUserId = authRepository.currentUser?.uid;
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todoList = snapshot.data as List<Todo>;
          return ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: todoList.length,
            itemBuilder: (context, index) => TodoTile(
              currentUserId: currentUserId,
              todo: todoList[index],
            ),
            separatorBuilder: (context, index) => _divider(),
          );
        });
  }

  _divider() {
    return const Divider(
      height: 4,
      thickness: 4,
      color: ColorName.black,
    );
  }
}
