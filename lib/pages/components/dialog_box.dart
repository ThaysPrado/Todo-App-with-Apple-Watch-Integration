import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onSave,
                  color: Theme.of(context).primaryColor,
                  child: const Text("Save"),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  onPressed: onCancel,
                  // color: Theme.of(context).primaryColor,
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
