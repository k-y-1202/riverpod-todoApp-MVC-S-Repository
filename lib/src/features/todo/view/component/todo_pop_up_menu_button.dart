import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

class TodoPopUpMenuButton extends ConsumerWidget {
  const TodoPopUpMenuButton({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 'edit':
            _editTodo(context: context);
            break;
          case 'delete':
            _changeToDone(context: context, ref: ref);
            break;
        }
      },
      tooltip: '',
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'edit',
          child: Text('編集'),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text('削除'),
        ),
      ],
    );
  }

  _changeToDone({required BuildContext context, required WidgetRef ref}) async {
    final todoRepo = ref.read(todoServiceProvider.notifier);
    await todoRepo
        .changeToDone(
          todoId: todo.todoId,
          title: todo.title,
        )
        .then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('タスクを削除しました'),
            ),
          ),
        );
  }

  _editTodo({required BuildContext context}) {
    context.go('${AppPage.editTodo.toPath}/${todo.todoId}');
  }
}
