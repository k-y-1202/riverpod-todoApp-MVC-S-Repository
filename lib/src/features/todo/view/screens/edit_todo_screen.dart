import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/edit_todo_controller.dart';

class EditTodoScreen extends HookConsumerWidget {
  const EditTodoScreen({
    super.key,
    required this.todoId,
  });

  final String todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final deviceWidth = MediaQuery.of(context).size.width;
    final isLoading = ref.watch(editTodoControllerProvider);

    // タスク編集時にsnack barを表示
    ref.listen(editTodoControllerProvider, (previous, next) {
      if (previous is AsyncLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('タスクを編集しました'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク編集画面'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryTextField(
                    controller: titleController,
                    title: 'タスク',
                    hintText: '洗濯する',
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    width: double.infinity,
                    text: '確定する',
                    onPressed: () async {
                      String title = titleController.text;
                      final editTodoController =
                          ref.read(editTodoControllerProvider.notifier);
                      await editTodoController.editTodo(
                          todoId: todoId, title: title, isDone: false);
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
