import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/team_todo_list_controller.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/component/todo_list_builder.dart';

class TeamTodoListScreen extends ConsumerWidget {
  const TeamTodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(teamTodoListControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : TodoListBuilder(todoList: provider.todoList),
    );
  }
}
