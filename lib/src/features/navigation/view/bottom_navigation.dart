import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.child,
    required this.path,
  });

  final Widget child;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: 0,
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
