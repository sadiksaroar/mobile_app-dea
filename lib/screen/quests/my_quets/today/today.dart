import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  bool showQuests = false;
  List<Map<String, dynamic>> quests = [
    {
      "emoji": "🧹",
      "title": "Clean house",
      "levelText": "Soft steps",
      "levelColor": const Color(0xFF77D47D),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "📘",
      "title": "Do homework",
      "levelText": "Elevated",
      "levelColor": const Color(0xFFF7A94B),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "🍽️",
      "title": "Do dishes",
      "levelText": "Stretch zone",
      "levelColor": const Color(0xFF6AA7FF),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "🏋️",
      "title": "Workout",
      "levelText": "Power move",
      "levelColor": const Color(0xFFFF5A5A),
      "time": "22:00",
      "duration": "10 mins",
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (showQuests) {
      return _todayQuests();
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ===== TOP ICON =====
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

            // ===== BIG TITLE =====
            const Text(
              "No quests yet, but your\njourney starts here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF021B4A),
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            // ===== SUBTEXT =====
            const Text(
              "Add your first quest and take the smallest\npossible step — we're not chasing\nperfection, just progress.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4B587C),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            // ===== CREATE QUEST BUTTON =====
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showQuests = true;
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
                      "Create quest",
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

  Widget _todayQuests() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: quests.length,
      itemBuilder: (context, index) {
        final quest = quests[index];
        return Slidable(
          key: ValueKey(quest["title"]),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.20, // Reduced to bring it closer
            children: [
              SlidableAction(
                onPressed: (context) {
                  setState(() {
                    quests.removeAt(index);
                  });
                },
                backgroundColor: const Color(0xFFFF5A5A),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.all(
                  10,
                ), // Compact padding like edit icon
              ),
            ],
          ),
          child: QuestCard(
            emoji: quest["emoji"],
            title: quest["title"],
            levelText: quest["levelText"],
            levelColor: quest["levelColor"],
            time: quest["time"],
            duration: quest["duration"],
          ),
        );
      },
    );
  }
}

class QuestCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String levelText;
  final Color levelColor;
  final String time;
  final String duration;

  const QuestCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.levelText,
    required this.levelColor,
    required this.time,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.orange.shade300, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CheckBox
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey),
            ),
          ),

          // ------- Middle Content -------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$emoji  $title",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),

                // Time Row
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    const Text("Today"),

                    const SizedBox(width: 12),
                    const Icon(Icons.access_time, size: 16, color: Colors.blue),
                    const SizedBox(width: 6),
                    Text(time),
                  ],
                ),

                const SizedBox(height: 8),

                // Level tag + duration
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: levelColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        levelText,
                        style: TextStyle(
                          color: levelColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ------------ Edit Icon ------------
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.edit, size: 16, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
