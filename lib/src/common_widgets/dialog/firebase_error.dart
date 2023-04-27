import 'package:flutter/material.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/dialog/show_dialog.dart';

class EM {
  static void firebaseAuth(BuildContext context, String code) {
    // エラーハンドリング
    // 新規アカウント登録
    // https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
    // ログイン
    // https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html

    String title;
    String content;
    switch (code) {
      case "email-already-in-use":
        title = "すでに登録済みのメールアドレスです";
        content = "ログイン画面から再度サインインしてください";
        break;
      case "invalid-email":
        title = "無効なメールアドレスです";
        content = "メールアドレスをご確認の上、もう一度実行してください";
        break;
      case "operation-not-allowed":
        title = "許可されていないメールアドレスです";
        content = "違うメールアドレスとパスワードで再度サインインしてください";
        break;
      case "weak-password":
        title = "パスワードが脆弱です";
        content = "英数字8文字以上のパスワードを設定してください";
        break;
      case "user-disabled":
        title = "無効なアカウントです";
        content = "別のアカウントでサインインしなおしてください";
        break;
      case "user-not-found":
        title = "アカウントが見つかりませんでした";
        content = "別のアカウントでサインインしなおしてください";
        break;
      case "wrong-password":
        title = "ログインに失敗しました";
        content = "メールアドレスまたはパスワードが間違っています";
        break;
      default:
        title = "不明なエラーです";
        content = "通信環境をご確認の上、もう一度実行してください";
    }

    SD.dialog(context: context, title: title, content: content);
  }
}
