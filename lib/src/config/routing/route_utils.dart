// todoアプリの画面遷移を管理するenum
enum AppPage {
  login,
  todos,
  addTodo,
  profile,
  editProfile,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.login:
        return '/login';
      case AppPage.todos:
        return '/todos';
      case AppPage.addTodo:
        return '/add-todo';
      case AppPage.profile:
        return '/profile';
      case AppPage.editProfile:
        return '/edit-profile';
    }
  }
}
