import 'package:flutter/material.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('パスワードリセット'),
      ),
      body: const Center(
        child: Text('パスワードリセット'),
      ),
    );
  }
}
