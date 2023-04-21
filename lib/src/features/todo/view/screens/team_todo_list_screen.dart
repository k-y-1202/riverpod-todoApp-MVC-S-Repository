import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/todo_list_controller.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/component/todo_list_builder.dart';

class TeamTodoListScreen extends ConsumerWidget {
  const TeamTodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(todoListControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('みんなのタスク'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TodoListBuilder(
              stream: provider.teamTodoList(),
            ),
          ),
        ],
      ),
    );
  }
}
