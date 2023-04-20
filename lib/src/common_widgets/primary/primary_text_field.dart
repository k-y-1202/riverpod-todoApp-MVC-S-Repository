import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.title,
    this.hintText,
    this.controller,
    this.width,
    this.height,
  });

  final String? title, hintText;
  final TextEditingController? controller;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Column(
              children: [
                Text(
                  title!,
                ),
                const SizedBox(height: 8),
              ],
            ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'タスク名',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
