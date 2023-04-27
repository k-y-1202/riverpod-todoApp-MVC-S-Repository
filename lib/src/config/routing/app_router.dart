import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/go_router_refresh_stream.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/controller/auth_controller.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/view/auth_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/view/custom_sign_in_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/navigation/view/bottom_navigation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/view/screens/profile_details_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/view/screens/profile_edit_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/add_todo_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/my_todo_list_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/team_todo_list_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: AppPage.login.toPath,
    debugLogDiagnostics: true, // デバッグ時にログを出力する
    // ログイン状態に応じて画面遷移先を変更する
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      // ログインしている場合は、ログイン画面に遷移しない
      if (isLoggedIn) {
        if (state.subloc.startsWith(AppPage.login.toPath)) {
          return AppPage.teamTodoList.toPath;
        }
      }
      // ログインしていない場合は、ログイン画面に遷移する
      else {
        return AppPage.login.toPath;
      }
      return null;
    },
    // ログイン状態の変更を検知する
    refreshListenable: GoRouterRefreshStream(
      authRepository.authStateChanges(),
    ),
    routes: [
      // ログイン画面
      GoRoute(
        path: AppPage.login.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          // child: CustomSignInScreen(),
          child: AuthScreen(),
        ),
      ),
      ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: BottomNavigation(
              path: state.location,
              child: child,
            ),
          );
        },
        routes: [
          // チームのtodo一覧画面
          GoRoute(
            path: AppPage.teamTodoList.toPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TeamTodoListScreen(),
            ),
          ),
          // 自分のtodo一覧画面
          GoRoute(
            path: AppPage.myTodoList.toPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MyTodoListScreen(),
            ),
          ),
          // todo追加画面
          GoRoute(
            path: AppPage.addTodo.toPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AddTodoScreen(),
            ),
          ),
          // プロフィール画面
          GoRoute(
            path: AppPage.profile.toPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileDetailsScreen(),
            ),
          ),
          // プロフィール編集画面
          GoRoute(
            path: AppPage.editProfile.toPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileEditScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
