import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/utils/styles.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/data_model/user.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/user_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/data_model/todo.dart';

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
    final user = useState<User?>(null);
    void getUser() async {
      final userRepo = ref.read(userRepoProvider);
      final result = await userRepo.getUser(userId: todo.userId);
      user.value = result;
    }

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
              Text(
                '投稿者：${user.value?.userName ?? ''}',
                style: StyleName.description,
              ),
            ],
          ),
        ),
        if (todo.userId == currentUserId)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
      ],
    );
  }
}
