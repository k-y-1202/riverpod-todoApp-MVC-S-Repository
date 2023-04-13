import 'package:go_router/go_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/main.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppPage.login.toPath,
    routes: [
      // ログイン画面
      GoRoute(
        path: AppPage.login.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TestScreen(),
        ),
      ),
      // アカウント作成画面
      GoRoute(
        path: AppPage.signUp.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TestScreen(),
        ),
      ),
      // todo一覧画面
      GoRoute(
        path: AppPage.todos.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TestScreen(),
        ),
      ),
      // todo追加画面
      GoRoute(
        path: AppPage.addTodo.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TestScreen(),
        ),
      ),
      // プロフィール画面
      GoRoute(
        path: AppPage.profile.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TestScreen(),
        ),
      ),
      // プロフィール編集画面
      GoRoute(
        path: AppPage.editProfile.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TestScreen(),
        ),
      ),
    ],
  );
}
