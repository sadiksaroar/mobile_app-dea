import 'dart:io';

import 'package:flutter/material.dart';

/////////////////////////////////////////////////////////////////////
/// QUEST LIST + TASK CARD
//////////////////////////////////////////////////////////////////////

List<Map<String, dynamic>> quests = [
  {
    "emoji": "🧹",
    "title": "Clean house",
    "levelText": "Soft steps",
    "levelColor": Color(0xFF77D47D),
    "time": "22:00",
    "duration": "10 mins",
  },
  {
    "emoji": "📘",
    "title": "Do homework",
    "levelText": "Elevated",
    "levelColor": Color(0xFFF7A94B),
    "time": "22:00",
    "duration": "10 mins",
  },
  {
    "emoji": "🍽️",
    "title": "Do dishes",
    "levelText": "Stretch zone",
    "levelColor": Color(0xFF6AA7FF),
    "time": "22:00",
    "duration": "10 mins",
  },
  {
    "emoji": "🏋️",
    "title": "Workout",
    "levelText": "Power move",
    "levelColor": Color(0xFFFF5A5A),
    "time": "22:00",
    "duration": "10 mins",
  },
];

class QuestList extends StatelessWidget {
  const QuestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: quests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = quests[index];
        return TaskCard(
          emoji: item['emoji'],
          title: item['title'],
          levelText: item['levelText'],
          levelColor: item['levelColor'],
          time: item['time'],
          duration: item['duration'],
        );
      },
    );
  }
}

//////////////////////////////////////////////////////////////////////
/// TASK CARD
//////////////////////////////////////////////////////////////////////

class TaskCard extends StatefulWidget {
  final String emoji;
  final String title;
  final String levelText;
  final Color levelColor;
  final String time;
  final String duration;

  const TaskCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.levelText,
    required this.levelColor,
    required this.time,
    required this.duration,
  });

  static const String uploadedImagePath =
      '/mnt/data/ec55cb33-aecd-4f73-acee-b8bf326d88b9.png';

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isCompleted = true;
  void _showPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Popup',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (_, animation, __, ___) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return Align(
          alignment: Alignment.bottomCenter,
          // 24 px left/right padding and 20 px space from bottom
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(curved),
              child: Material(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Repeat this quest?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Icon(Icons.calendar_today, size: 18),
                          SizedBox(width: 8),
                          Text('Tomorrow'),
                          Spacer(),
                          Icon(Icons.check_circle, size: 18),
                          SizedBox(width: 6),
                          Text('22:00'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Edit time'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Yes'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFF4DCC9), width: 1),
      ),
      elevation: 0,
      color: const Color(0xFFFFF9F3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CLICKABLE TOP ROW
            GestureDetector(
              onTap: () {
                setState(() {
                  isCompleted = !isCompleted;
                });
              },
              child: Row(
                children: [
                  Icon(
                    isCompleted
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: const Color(0xFF4C4CE6),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    isCompleted ? 'Completed' : 'Not completed',
                    style: const TextStyle(
                      color: Color(0xFF4C4CE6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEFE0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.repeat, color: Color(0xFF5A4C4C)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // TITLE ROW
            Row(
              children: [
                Text(widget.emoji, style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF021A3D),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // TIME + DATE
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: Color(0xFF223A60),
                ),
                const SizedBox(width: 6),
                const Text(
                  'Yesterday',
                  style: TextStyle(color: Color(0xFF223A60)),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.access_time_outlined,
                  size: 18,
                  color: Color(0xFF223A60),
                ),
                const SizedBox(width: 6),
                Text(
                  widget.time,
                  style: const TextStyle(color: Color(0xFF223A60)),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // CHIPS
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: widget.levelColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.levelText,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6E6D5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.duration,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // OPTIONAL IMAGE
            Builder(
              builder: (_) {
                try {
                  final file = File(TaskCard.uploadedImagePath);
                  if (file.existsSync()) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          file,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                } catch (_) {}
                return const SizedBox.shrink();
              },
            ),

            // BUTTON
            Center(
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    _showPopup(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF5C4CEA), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'See reflection',
                    style: TextStyle(
                      color: Color(0xFF5C4CEA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
