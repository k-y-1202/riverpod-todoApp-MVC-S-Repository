import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';

class BottomNavigation extends HookWidget {
  const BottomNavigation({
    super.key,
    required this.child,
    required this.path,
  });

  final Widget child;
  final String path;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0); // HooksのStateを使ってページ遷移を管理

    // 画面遷移時にcurrentIndexを更新
    useEffect(() {
      if (path == AppPage.teamTodoList.toPath) {
        currentIndex.value = 0;
        return null;
      }
      if (path == AppPage.myTodoList.toPath || path == AppPage.addTodo.toPath) {
        currentIndex.value = 1;
        return null;
      }
      if (path == AppPage.profile.toPath ||
          path == AppPage.editProfile.toPath) {
        currentIndex.value = 2;
        return null;
      }
      return null;
    });

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'みんな',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_outlined),
            label: '自分だけ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'マイページ',
          ),
        ],
        currentIndex: currentIndex.value,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppPage.teamTodoList.toPath);
              break;
            case 1:
              context.go(AppPage.myTodoList.toPath);
              break;
            case 2:
              context.go(AppPage.profile.toPath);
              break;
          }
        },
      ),
    );
  }
}
