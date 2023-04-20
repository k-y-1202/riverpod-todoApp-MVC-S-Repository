import 'package:flutter/material.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_button.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/common_widgets/primary/primary_text_field.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク追加画面'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PrimaryTextField(
              title: 'タスク',
              hintText: '洗濯する',
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              width: double.infinity,
              text: 'タスク追加',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
