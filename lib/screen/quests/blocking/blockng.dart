// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class Blockng extends StatefulWidget {
//   const Blockng({super.key});

//   @override
//   State<Blockng> createState() => _BlockngState();
// }

// class _BlockngState extends State<Blockng> {
//   bool showQuests = false;
//   List<Map<String, dynamic>> quests = [
//     {
//       "emoji": "🧹",
//       "title": "Clean house",
//       "levelText": "Soft steps",
//       "levelColor": const Color(0xFF77D47D),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//     {
//       "emoji": "📘",
//       "title": "Do homework",
//       "levelText": "Elevated",
//       "levelColor": const Color(0xFFF7A94B),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//     {
//       "emoji": "🍽️",
//       "title": "Do dishes",
//       "levelText": "Stretch zone",
//       "levelColor": const Color(0xFF6AA7FF),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//     {
//       "emoji": "🏋️",
//       "title": "Workout",
//       "levelText": "Power move",
//       "levelColor": const Color(0xFFFF5A5A),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//   ];
//   String selected = "Last 30 days";

//   final List<String> options = [
//     "All time",
//     "Today",
//     "Last 7 days",
//     "Last 30 days",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     if (showQuests) {
//       return _todayQuests();
//     }

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // ===== TOP ICON =====
//             Container(
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE9F0FF),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Image.asset(
//                 "assets/svg_images/Button Calendar.png",
//                 height: 50,
//                 width: 50,
//               ),
//             ),

//             const SizedBox(height: 24),

//             // ===== BIG TITLE =====
//             const Text(
//               "No quests yet, but your\njourney starts here.",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Color(0xFF021B4A),
//                 fontWeight: FontWeight.w800,
//               ),
//             ),

//             const SizedBox(height: 12),

//             // ===== SUBTEXT =====
//             const Text(
//               "Add your first quest and take the smallest\npossible step — we're not chasing\nperfection, just progress.",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Color(0xFF4B587C),
//                 height: 1.4,
//               ),
//             ),

//             const SizedBox(height: 24),

//             // ===== CREATE QUEST BUTTON =====
//             SizedBox(
//               width: 180,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     showQuests = true;
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4C46F5),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.add, color: Colors.white),
//                     SizedBox(width: 6),
//                     Text(
//                       "Create quest",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _todayQuests() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Dropdown Filter
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 dropdownColor: Colors.white,
//                 value: selected,
//                 icon: const Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Colors.black,
//                 ),
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//                 items: options.map((value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selected = value!;
//                   });
//                 },
//               ),
//             ),
//           ),
//         ),

//         // Quest List
//         Expanded(
//           child: ListView.builder(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             itemCount: quests.length,
//             itemBuilder: (context, index) {
//               final quest = quests[index];
//               return QuestCard(
//                 emoji: quest["emoji"],
//                 title: quest["title"],
//                 levelText: quest["levelText"],
//                 levelColor: quest["levelColor"],
//                 time: quest["time"],
//                 duration: quest["duration"],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class QuestCard extends StatelessWidget {
//   final String emoji;
//   final String title;
//   final String levelText;
//   final Color levelColor;
//   final String time;
//   final String duration;

//   const QuestCard({
//     super.key,
//     required this.emoji,
//     required this.title,
//     required this.levelText,
//     required this.levelColor,
//     required this.time,
//     required this.duration,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//         border: Border.all(color: Colors.orange.shade300, width: 1),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Expanded Middle Content
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "$emoji  $title",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 6),

//                 // Time Row
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.calendar_today,
//                       size: 16,
//                       color: Colors.blue,
//                     ),
//                     const SizedBox(width: 6),
//                     const Text("Today"),
//                     const SizedBox(width: 12),
//                     const Icon(Icons.access_time, size: 16, color: Colors.blue),
//                     const SizedBox(width: 6),
//                     Text(time),
//                   ],
//                 ),

//                 const SizedBox(height: 8),

//                 // Level tag + duration
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: levelColor.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         levelText,
//                         style: TextStyle(
//                           color: levelColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         duration,
//                         style: const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Edit Icon
//           Container(
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               color: Colors.orange.shade100,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(Icons.edit, size: 16, color: Colors.orange),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Blockng extends StatefulWidget {
  const Blockng({super.key});

  @override
  State<Blockng> createState() => _BlockngState();
}

class _BlockngState extends State<Blockng> {
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
  String selected = "Last 30 days";

  final List<String> options = [
    "All time",
    "Today",
    "Last 7 days",
    "Last 30 days",
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown Filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: selected,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      items: options.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Clear all",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
            ],
          ),
          // Quest List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: quests.map((quest) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: QuestCard(
                    emoji: quest["emoji"],
                    title: quest["title"],
                    levelText: quest["levelText"],
                    levelColor: quest["levelColor"],
                    time: quest["time"],
                    duration: quest["duration"],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
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

  Color _getLevelBgColor() {
    if (levelColor.value == const Color(0xFF77D47D).value) {
      return const Color(0xFFD6F5D4);
    } else if (levelColor.value == const Color(0xFFF7A94B).value) {
      return const Color(0xFFFFE8CC);
    } else if (levelColor.value == const Color(0xFF6AA7FF).value) {
      return const Color(0xFFD6E8FF);
    } else {
      return const Color(0xFFFFD6D6);
    }
  }

  Color _getLevelTextColor() {
    if (levelColor.value == const Color(0xFF77D47D).value) {
      return const Color(0xFF075E26);
    } else if (levelColor.value == const Color(0xFFF7A94B).value) {
      return const Color(0xFF8A5C31);
    } else if (levelColor.value == const Color(0xFF6AA7FF).value) {
      return const Color(0xFF003D99);
    } else {
      return const Color(0xFF990000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEEDCC5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- Top Row: Missed + Refresh Icon ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.red.shade400,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Quest missed",
                    style: TextStyle(
                      color: Color(0xFFCC2B2B),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Refresh action
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7E7D9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.refresh,
                    color: Colors.brown.shade400,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // --- Title + Icon ---
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF03145B),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // --- Date + Time ---
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 18,
                color: Color(0xFF03145B),
              ),
              const SizedBox(width: 6),
              const Text(
                "Yesterday",
                style: TextStyle(
                  color: Color(0xFF03145B),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.check_circle,
                size: 18,
                color: Color(0xFF03145B),
              ),
              const SizedBox(width: 6),
              Text(
                time,
                style: const TextStyle(
                  color: Color(0xFF03145B),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // --- Tags ---
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getLevelBgColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  levelText,
                  style: TextStyle(
                    fontSize: 14,
                    color: _getLevelTextColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8E7D3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8A5C31),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // --- Bottom Buttons ---
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Mark as completed action
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFF5C3DFF)),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Actually, I did this",
                      style: TextStyle(
                        color: Color(0xFF5C3DFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Skip action
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFF5C3DFF)),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Color(0xFF5C3DFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
