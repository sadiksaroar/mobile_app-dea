import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/completed/task_card/task_card.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  bool showQuests = false;

  @override
  Widget build(BuildContext context) {
    // 🔥 Start quest চাপলে Quest List দেখাবে
    if (showQuests) {
      return const QuestList();
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TOP ICON
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F0FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                "assets/svg_images/Button Calendar.png",
                height: 50,
                width: 50,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "No quests completed yet.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF021B4A),
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Progress comes in small wins — start today and this list will grow.\nYou’ve got this.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4B587C),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            // START QUEST BUTTON
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showQuests = true; // Show the tasks
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C46F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 6),
                    Text(
                      "Start quest",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
