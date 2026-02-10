// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';

// class Today extends StatefulWidget {
//   const Today({super.key});

//   @override
//   State<Today> createState() => _TodayState();
// }

// class _TodayState extends State<Today> {
//   bool showQuests = false;
//   List<Map<String, dynamic>> quests = [
//     {
//       "emoji": "🧹",
//       "title": "Clean house",
//       "levelText": "Soft steps",
//       "levelColor": Color(0xFFA0E871),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//     {
//       "emoji": "📘",
//       "title": "Do homework",
//       "levelText": "Elevated",
//       "levelColor": const Color(0xFF3D87F5),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//     {
//       "emoji": "🍽️",
//       "title": "Do dishes",
//       "levelText": "Stretch zone",
//       "levelColor": Color(0xFFFF8F26),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//     {
//       "emoji": "🏋️",
//       "title": "Workout",
//       "levelText": "Power move",
//       "levelColor": Color(0xFFD53D40),
//       "time": "22:00",
//       "duration": "10 mins",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     if (showQuests) {
//       return _todayQuests();
//     }

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // ===== TOP ICON =====
//               Container(
//                 padding: const EdgeInsets.all(18),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFE9F0FF),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Image.asset(
//                   "assets/svg_images/Button Calendar.png",
//                   height: 50,
//                   width: 50,
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // ===== BIG TITLE =====
//               Text(
//                 "No quests yet, but your\njourney starts here.",
//                 textAlign: TextAlign.center,
//                 style: AppsTextStyles.workSansExtraBold20Center,
//               ),

//               const SizedBox(height: 12),

//               // ===== SUBTEXT =====
//               Text(
//                 "Add your first quest and take the smallest\npossible step — we're not chasing\nperfection, just progress.",
//                 textAlign: TextAlign.center,
//                 style: AppsTextStyles.workSansRegularAdd16,
//               ),

//               const SizedBox(height: 24),

//               // ===== CREATE QUEST BUTTON =====
//               SizedBox(
//                 width: 230,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       showQuests = true;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4C46F5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(Icons.add, color: Colors.white, size: 24),
//                       const SizedBox(width: 6),
//                       Text(
//                         "Create quest",
//                         style: AppsTextStyles.workSansBlack18Center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _todayQuests() {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: quests.length,
//       itemBuilder: (context, index) {
//         final quest = quests[index];
//         return Slidable(
//           key: ValueKey(quest["title"]),
//           endActionPane: ActionPane(
//             motion: const DrawerMotion(),
//             extentRatio: 0.20,
//             children: [
//               SlidableAction(
//                 onPressed: (context) {
//                   setState(() {
//                     quests.removeAt(index);
//                   });
//                 },
//                 backgroundColor: const Color(0xFFFF5A5A),
//                 foregroundColor: Colors.white,
//                 icon: Icons.delete,
//                 borderRadius: BorderRadius.circular(12),
//                 padding: const EdgeInsets.all(10),
//               ),
//             ],
//           ),
//           child: QuestCard(
//             emoji: quest["emoji"],
//             title: quest["title"],
//             levelText: quest["levelText"],
//             levelColor: quest["levelColor"],
//             time: quest["time"],
//             duration: quest["duration"],
//           ),
//         );
//       },
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
//       // Remove fixed height to let content determine size
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Color(0xFFFFFEF8),
//         border: Border.all(color: const Color(0xFFFFCB9B), width: 1),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // CheckBox
//           Container(
//             margin: const EdgeInsets.only(right: 12),
//             width: 25,
//             height: 25,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(color: Color(0xFF4542EB)),
//             ),
//           ),

//           // ------- Middle Content -------
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize
//                   .min, // Important: Don't take more space than needed
//               children: [
//                 // Title with emoji
//                 Text(
//                   "$emoji  $title",
//                   style: AppsTextStyles.regularResponsive(context),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 16), // Reduced from 30
//                 // Time Row - Made more compact
//                 Wrap(
//                   spacing: 20,
//                   runSpacing: 8,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(
//                           Icons.calendar_today,
//                           size: 18, // Slightly smaller
//                           color: Color(0xFF011F54),
//                         ),
//                         const SizedBox(width: 8),
//                         Text("Today", style: AppsTextStyles.extraBold16),
//                       ],
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(
//                           Icons.access_time,
//                           size: 18, // Slightly smaller
//                           color: Color(0xFF011F54),
//                         ),
//                         const SizedBox(width: 8),
//                         Text(time, style: AppsTextStyles.extraBold16),
//                       ],
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16), // Reduced from 25
//                 // Level tag + duration - Made flexible
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
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
//                         style: AppsTextStyles.labelworkSansSemiBold18,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFFAE3CE),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         duration,
//                         style: const TextStyle(fontWeight: FontWeight.w800),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(width: 8),

//           // ------------ Edit Icon ------------
//           Container(
//             height: 40, // Reduced from 48
//             width: 40, // Reduced from 48
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               color: Colors.orange.shade100,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(
//               Icons.edit,
//               size: 20,
//               color: Color(0xFF011F54),
//             ), // Reduced from 24
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

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
      "levelColor": Color(0xFFA0E871),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "📘",
      "title": "Do homework",
      "levelText": "Elevated",
      "levelColor": const Color(0xFF3D87F5),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "🍽️",
      "title": "Do dishes",
      "levelText": "Stretch zone",
      "levelColor": Color(0xFFFF8F26),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "🏋️",
      "title": "Workout",
      "levelText": "Power move",
      "levelColor": Color(0xFFD53D40),
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
        child: SingleChildScrollView(
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
              Text(
                "No quests yet, but your\njourney starts here.",
                textAlign: TextAlign.center,
                style: AppsTextStyles.workSansExtraBold20Center,
              ),

              const SizedBox(height: 12),

              // ===== SUBTEXT =====
              Text(
                "Add your first quest and take the smallest\npossible step — we're not chasing\nperfection, just progress.",
                textAlign: TextAlign.center,
                style: AppsTextStyles.workSansRegularAdd16,
              ),

              const SizedBox(height: 24),

              // ===== CREATE QUEST BUTTON =====
              SizedBox(
                width: 230,
                height: 50,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 24),
                      const SizedBox(width: 6),
                      Text(
                        "Create quest",
                        style: AppsTextStyles.workSansBlack18Center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
            extentRatio: 0.20,
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
                padding: const EdgeInsets.all(10),
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
        color: Color(0xFFFFFEF8),
        border: Border.all(color: const Color(0xFFFFCB9B), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CheckBox
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Color(0xFF4542EB)),
            ),
          ),

          // ------- Middle Content -------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title with emoji
                Text(
                  "$emoji  $title",
                  style: AppsTextStyles.regularResponsive(context),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                // Time Row
                Wrap(
                  spacing: 20,
                  runSpacing: 8,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: Color(0xFF011F54),
                        ),
                        const SizedBox(width: 8),
                        Text("Today", style: AppsTextStyles.extraBold16),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 18,
                          color: Color(0xFF011F54),
                        ),
                        const SizedBox(width: 8),
                        Text(time, style: AppsTextStyles.extraBold16),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // Level tag + duration in ROW
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: levelColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        levelText,
                        style: AppsTextStyles.labelworkSansSemiBold18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAE3CE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ------------ Edit Icon ------------
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.edit, size: 20, color: Color(0xFF011F54)),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

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
      "levelColor": const Color(0xFFA0E871),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "📘",
      "title": "Do homework",
      "levelText": "Elevated",
      "levelColor": const Color(0xFF3D87F5),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "🍽️",
      "title": "Do dishes",
      "levelText": "Stretch zone",
      "levelColor": const Color(0xFFFF8F26),
      "time": "22:00",
      "duration": "10 mins",
    },
    {
      "emoji": "🏋️",
      "title": "Workout",
      "levelText": "Power move",
      "levelColor": const Color(0xFFD53D40),
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
      child: SingleChildScrollView(
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
              Text(
                "No quests yet, but your\njourney starts here.",
                textAlign: TextAlign.center,
                style: AppsTextStyles.workSansExtraBold20Center,
              ),

              const SizedBox(height: 12),

              // ===== SUBTEXT =====
              Text(
                "Add your first quest and take the smallest\npossible step — we're not chasing\nperfection, just progress.",
                textAlign: TextAlign.center,
                style: AppsTextStyles.workSansRegularAdd16,
              ),

              const SizedBox(height: 24),

              // ===== CREATE QUEST BUTTON =====
              SizedBox(
                width: 230,
                height: 50,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 24),
                      const SizedBox(width: 6),
                      Text(
                        "Create quest",
                        style: AppsTextStyles.workSansBlack18Center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _todayQuests() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Filter
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

        // Quest List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: quests.length,
            itemBuilder: (context, index) {
              final quest = quests[index];
              return Slidable(
                key: ValueKey(quest["title"]),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  extentRatio: 0.20,
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
                      padding: const EdgeInsets.all(10),
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
          ),
        ),
      ],
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
        color: const Color(0xFFFFFEF8),
        border: Border.all(color: const Color(0xFFFFCB9B), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------- Middle Content -------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$emoji  $title",
                  style: AppsTextStyles.regularResponsive(context),
                ),
                const SizedBox(height: 16),

                // Time Row
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: Color(0xFF011F54),
                    ),
                    const SizedBox(width: 10),
                    Text("Today", style: AppsTextStyles.extraBold16),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.access_time,
                      size: 20,
                      color: Color(0xFF011F54),
                    ),
                    const SizedBox(width: 10),
                    Text(time, style: AppsTextStyles.extraBold16),
                  ],
                ),

                const SizedBox(height: 16),
                // Level tag + duration - Changed to Wrap
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: levelColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        levelText,
                        style: TextStyle(
                          color: levelColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE3CE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // ------------ Edit Icon ------------
          Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.edit, size: 24, color: Color(0xFF011F54)),
          ),
        ],
      ),
    );
  }
}
