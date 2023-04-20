// todoアプリの画面遷移を管理するenum
enum AppPage {
  login,
  teamTodoList,
  myTodoList,
  addTodo,
  profile,
  editProfile,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.login:
        return '/login';
      case AppPage.teamTodoList:
        return '/Team-todo-list';
      case AppPage.myTodoList:
        return '/my-todo-list';
      case AppPage.addTodo:
        return '/add-todo';
      case AppPage.profile:
        return '/profile';
      case AppPage.editProfile:
        return '/edit-profile';
    }
  }
}
