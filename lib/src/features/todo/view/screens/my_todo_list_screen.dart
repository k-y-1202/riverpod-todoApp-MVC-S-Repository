import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/todo_list_controller.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/component/todo_list_builder.dart';

class MyTodoListScreen extends ConsumerWidget {
  const MyTodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(todoListControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('自分だけのタスク'),
      ),
      body: TodoListBuilder(
        stream: controller.myTodoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(AppPage.addTodo.toPath);
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
