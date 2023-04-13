import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';

class TodoListBuilder extends ConsumerWidget {
  const TodoListBuilder({
    super.key,
    required this.todoList,
  });

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final currentUserId = authRepository.currentUser?.uid;
    return ListView.separated(
      itemCount: todoList.length,
      itemBuilder: (context, index) =>
          _todoTile(todoList[index], currentUserId),
      separatorBuilder: (context, index) => _divider(),
    );
  }

  _todoTile(Todo todo, String? currentUserId) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(todo.title),
              Text(todo.userId),
            ],
          ),
        ),
        if (todo.userId == currentUserId)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
      ],
    );
  }

  _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
    );
  }
}
