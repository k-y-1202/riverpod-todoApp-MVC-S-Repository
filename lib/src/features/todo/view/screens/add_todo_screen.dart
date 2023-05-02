import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/add_todo_controller.dart';

class AddTodoScreen extends HookConsumerWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final deviceWidth = MediaQuery.of(context).size.width;
    final isLoading = ref.watch(addTodoControllerProvider);

    // タスク追加時にsnack barを表示
    ref.listen(addTodoControllerProvider, (previous, next) {
      if (previous is AsyncLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('タスクを追加しました'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク追加画面'),
        leading: IconButton(
          onPressed: () => context.go(AppPage.myTodoList.toPath),
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
                    text: 'タスク追加',
                    onPressed: () async {
                      String title = titleController.text;
                      final addTodoController =
                          ref.read(addTodoControllerProvider.notifier);
                      await addTodoController.addTodo(title);
                      context.go(AppPage.myTodoList.toPath);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
