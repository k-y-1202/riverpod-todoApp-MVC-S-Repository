import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SD {
  static void dialog({
    required BuildContext context,
    required String title,
    required String content,
    String? goText,
    String? popText,
    VoidCallback? onPressed,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: Text(goText ?? "次へ"),
              ),
              TextButton(
                onPressed: () => context.pop(),
                child: Text(popText ?? "戻る"),
              ),
            ],
          );
        });
  }

  static void unknownError(BuildContext context) {
    SD.dialog(
      context: context,
      title: "不明なエラー",
      content: "ネットワーク環境をご確認の上、もう一度実行してください",
    );
  }
}
