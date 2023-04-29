import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/urls.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/repository/todo_repository.dart';

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

    void getUser() async {
      final userRepo = ref.read(userRepoProvider);
      final result = await userRepo.getUser(userId: todo.userId);
      user.value = result;
    }

    // 初回build時に発火するHooksの関数
    useEffect(() {
      getUser();
      return null;
    });

    return Row(
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
        if (todo.userId == currentUserId)
          IconButton(
            onPressed: () async {
              final todoRepo = ref.read(todoRepoProvider);
              await todoRepo
                  .updateTodo(
                    isDone: true,
                    todoId: todo.todoId,
                  )
                  .then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('タスクを削除しました'),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.delete),
          ),
      ],
    );
  }
}
