import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/providers/firebase_provider.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/go_router_refresh_stream.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/route_utils.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/auth/view/sign_in_up_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/navigation/view/bottom_navigation.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/view/screens/profile_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/profile/view/screens/profile_edit_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/add_todo_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/edit_todo_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/my_todo_list_screen.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/team_todo_list_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: AppPage.login.toPath,
    debugLogDiagnostics: true,
    // ログイン状態に応じて画面遷移先を変更する
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      final isLoginOrRegister = state.subloc.startsWith(AppPage.login.toPath) ||
          state.subloc.startsWith(AppPage.register.toPath);
      if (isLoggedIn) {
        if (isLoginOrRegister) {
          return AppPage.teamTodoList.toPath;
        }
      } else {
        if (isLoginOrRegister) {
          return null;
        }
        return AppPage.login.toPath;
      }
      return null;
    },
    // ログイン状態の変更を検知する
    refreshListenable: GoRouterRefreshStream(
      firebaseAuth.authStateChanges(),
    ),
    routes: [
      // ログイン画面
      GoRoute(
        path: AppPage.login.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInUpScreen(isRegister: false),
        ),
      ),
      // 新規登録画面
      GoRoute(
        path: AppPage.register.toPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInUpScreen(isRegister: true),
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
          // todo編集画面
          GoRoute(
            path: '${AppPage.editTodo.toPath}/:todoId',
            pageBuilder: (context, state) {
              final String todoId = state.params['todoId'] ?? '';
              return NoTransitionPage(
                child: EditTodoScreen(todoId: todoId),
              );
            },
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
