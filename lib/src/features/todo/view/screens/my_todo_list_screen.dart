import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/component/todo_list_builder.dart';

class MyTodoListScreen extends StatelessWidget {
  const MyTodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自分だけのタスク'),
      ),
      body: TodoListBuilder(
        todoList: [
          Todo(
            isDone: false,
            title: 'hoge',
            todoId: '',
            userId: '',
          ),
        ],
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
