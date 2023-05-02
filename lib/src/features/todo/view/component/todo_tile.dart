import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/urls.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/service/auth_service.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/controller/edit_todo_controller.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/service/todo_service.dart';

class TodoTile extends HookConsumerWidget {
  const TodoTile({
    super.key,
    required this.currentUserId,
    required this.todo,
  });

  final String? currentUserId;
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = useState<User?>(null); // HooksのStateを使ってユーザー情報を管理
    bool isMe = currentUserId == todo.userId;

    void getUser() async {
      // TODO:
      // final result = await ref.read(authServiceProvider).getUser();
      // user.value = result;
    }

    // 初回build時に発火するHooksの関数
    useEffect(() {
      getUser();
      return null;
    });

    return InkWell(
      onTap: isMe
          ? () => context.push('${AppPage.editTodo.toPath}/${todo.todoId}')
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: StyleName.title,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        '投稿者：',
                        style: StyleName.description,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: CachedNetworkImageProvider(
                          user.value?.userIcon ?? Urls.defaultIcon,
                        ),
                      ),
                      PaddingStyle.h8,
                      Text(
                        user.value?.userName ?? '',
                        style: StyleName.description,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isMe)
              IconButton(
                onPressed: () => _changeToDone(context: context, ref: ref),
                icon: const Icon(Icons.delete),
              ),
          ],
        ),
      ),
    );
  }

  _changeToDone({required BuildContext context, required WidgetRef ref}) async {
    final editTodoController = ref.read(editTodoControllerProvider.notifier);
    await editTodoController
        .editTodo(
      todoId: todo.todoId,
      title: todo.title,
      isDone: true,
    )
        .then(
      (value) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('タスクを削除しました'),
          ),
        );
      },
    );
  }
}
