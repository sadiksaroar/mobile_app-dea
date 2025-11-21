import 'package:flutter/material.dart';

class DeleteToast extends StatelessWidget {
  const DeleteToast({super.key, required Null Function() onUndo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 160,

      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0E0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.delete, color: Colors.red),
              const SizedBox(width: 8),
              const Text(
                "Quest deleted",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(width: 16),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
            child: const Text("Undo"),
          ),
        ],
      ),
    );
  }
}
