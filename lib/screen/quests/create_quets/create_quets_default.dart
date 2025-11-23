import 'dart:async' show Timer;

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/_buildInputCard/input_widget_card.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/buildAddSubtasksButton/build_add_subtask_button.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/buildHeader/header_widget.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/buildTitle/title_widget.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/enabable_card/enabable_card.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/repeat_quest_card/repeat_quest_card.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/select_zone_card/select_zone_card.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/time_picker_card/time_picker_card.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/when_card/when_card.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Quest UI',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const CreateQuestPage(),
    );
  }
}

class CreateQuestPage extends StatefulWidget {
  const CreateQuestPage({super.key});

  @override
  State<CreateQuestPage> createState() => _CreateQuestPageState();
}

class _CreateQuestPageState extends State<CreateQuestPage> {
  bool showSubtaskGenerator = false;
  bool showDesignScreen = false;
  bool showDateSelectionScreen = false;
  String? selectedZone;
  bool isCallEnabled = true;
  bool _switchValue = false;
  String selectedDateOption = 'Today';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final baseScale = width / 390.0;

    return Scaffold(
      backgroundColor: Color(0xFF89B6F8),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * baseScale,
                vertical: 12.0 * baseScale,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(),
                  SizedBox(height: 10 * baseScale),
                  TitleWidget(),
                  SizedBox(height: 14 * baseScale),
                  InputCardWidget(),
                  SizedBox(height: 12 * baseScale),
                  AddSubtasksButton(),
                  SizedBox(height: 12 * baseScale),
                  SelectZoneCard(),
                  SizedBox(height: 12 * baseScale),
                  WhenCard(),
                  SizedBox(height: 12 * baseScale),
                  // _buildTimeCard(baseScale),
                  TimePickerCard(),
                  SizedBox(height: 12 * baseScale),
                  EnableCallCard(),
                  SizedBox(height: 12 * baseScale),
                  RepeatQuestCard(),
                  SizedBox(height: 22 * baseScale),
                ],
              ),
            ),

            // DesignScreen Overlay
            if (showDesignScreen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showDesignScreen = false;
                    });
                  },
                  child: Container(
                    color: Colors.black54,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const DesignScreen(),
                      ),
                    ),
                  ),
                ),
              ),

            // DateSelectionScreen Overlay
            if (showDateSelectionScreen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showDateSelectionScreen = false;
                    });
                  },
                  child: Container(
                    color: Colors.black38,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: DateSelectionScreen(
                          onDateSelected: (day, weekday) {
                            setState(() {
                              selectedDateOption = '$weekday, Jan $day';
                              showDateSelectionScreen = false;
                            });
                          },
                          onClose: () {
                            setState(() {
                              showDateSelectionScreen = false;
                            });
                          },
                        ),
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

  // Widget _buildHeader(double s) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       CircleAvatar(
  //         radius: 18 * s,
  //         backgroundColor: Colors.white.withOpacity(0.85),
  //         child: Icon(Icons.arrow_back, color: Colors.blue[800], size: 22 * s),
  //       ),
  //       Container(
  //         width: 44 * s,
  //         height: 44 * s,
  //         decoration: BoxDecoration(
  //           color: const Color(0xFF5C4AE2),
  //           borderRadius: BorderRadius.circular(10 * s),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withOpacity(0.08),
  //               blurRadius: 6 * s,
  //               offset: Offset(0, 3 * s),
  //             ),
  //           ],
  //         ),
  //         child: Center(
  //           child: Icon(Icons.mic, color: Colors.white, size: 20 * s),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildTitle(double s) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'CREATE\nQUEST',
  //         style: TextStyle(
  //           fontWeight: FontWeight.w900,
  //           fontSize: 30 * s,
  //           height: 0.95,
  //           color: const Color(0xFF173A7A),
  //         ),
  //       ),
  //       SizedBox(height: 6 * s),
  //       Text(
  //         'Small steps big progress',
  //         style: TextStyle(fontSize: 12 * s, color: Colors.blueGrey[800]),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildInputCard(double s) {
  //   return Container(
  //     height: 160,
  //     width: double.infinity,
  //     padding: EdgeInsets.all(14 * s),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(14 * s),
  //       boxShadow: [
  //         BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8 * s),
  //       ],
  //     ),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         hintText: 'Write down your quest...',
  //         hintStyle: TextStyle(
  //           fontSize: 16 * s,
  //           color: Colors.grey[600],
  //           fontWeight: FontWeight.w600,
  //         ),
  //         border: InputBorder.none,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildAddSubtasksButton(double s) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFE6F0FF),
  //       borderRadius: BorderRadius.circular(12 * s),
  //       border: Border.all(color: Colors.blue.shade100, width: 1.5),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 24 * s, vertical: 8 * s),
  //           child: Row(
  //             children: [
  //               Icon(
  //                 Icons.format_list_bulleted,
  //                 color: Colors.blue[900],
  //                 size: 20 * s,
  //               ),
  //               SizedBox(width: 8 * s),
  //               Expanded(
  //                 child: Text(
  //                   'ADD SUBTASKS',
  //                   style: TextStyle(
  //                     color: Colors.blue[900],
  //                     fontWeight: FontWeight.w700,
  //                     fontSize: 13 * s,
  //                     letterSpacing: 0.5,
  //                   ),
  //                 ),
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     showSubtaskGenerator = !showSubtaskGenerator;
  //                   });
  //                 },
  //                 child: Container(
  //                   width: 32 * s,
  //                   height: 32 * s,
  //                   decoration: BoxDecoration(
  //                     color: Colors.blue[700],
  //                     borderRadius: BorderRadius.circular(8 * s),
  //                   ),
  //                   child: Icon(Icons.add, color: Colors.white, size: 20 * s),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         if (showSubtaskGenerator) ...[
  //           SizedBox(height: 12 * s),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 12 * s),
  //             child: GestureDetector(
  //               onTap: () {},
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(vertical: 14 * s),
  //                 decoration: BoxDecoration(
  //                   color: const Color(0xFF89B6F8),
  //                   borderRadius: BorderRadius.circular(12 * s),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.1),
  //                       blurRadius: 8,
  //                       offset: const Offset(0, 2),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(
  //                       Icons.auto_awesome,
  //                       color: Colors.white,
  //                       size: 18 * s,
  //                     ),
  //                     SizedBox(width: 8 * s),
  //                     Text(
  //                       "Generate subtasks",
  //                       style: TextStyle(
  //                         fontSize: 15 * s,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 12 * s),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 12 * s),
  //             child: Container(
  //               padding: EdgeInsets.all(14 * s),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(12 * s),
  //                 border: Border.all(color: Colors.blue.shade100, width: 1.5),
  //               ),
  //               child: TextField(
  //                 maxLines: 3,
  //                 decoration: InputDecoration(
  //                   hintText: 'Write subtask...',
  //                   hintStyle: TextStyle(
  //                     color: Colors.grey[400],
  //                     fontSize: 15 * s,
  //                     fontWeight: FontWeight.w500,
  //                     height: 1.4,
  //                   ),
  //                   border: InputBorder.none,
  //                   isDense: true,
  //                   contentPadding: EdgeInsets.zero,
  //                 ),
  //                 style: TextStyle(fontSize: 15 * s, color: Colors.blue[900]),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 12 * s),
  //         ],
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildSelectZoneCard(double s) {
  //   final chips = ['Soft steps', 'Elevated', 'Stretch zone', 'Power move'];

  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(12 * s),
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFE6F0FF),
  //       borderRadius: BorderRadius.circular(12 * s),
  //     ),
  //     child: Column(
  //       children: [
  //         Column(
  //           children: [
  //             Row(
  //               children: [
  //                 Icon(Icons.bar_chart, color: Colors.blue[900]),
  //                 SizedBox(width: 8 * s),
  //                 Text(
  //                   'SELECT A ZONE',
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 14 * s,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 6 * s),
  //             Text(
  //               "Label how demanding this feels - \nit helps track your progress over time.",
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10 * s),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 14 * s),
  //         Row(
  //           children: [
  //             Expanded(child: _zoneChip(chips[0], s)),
  //             SizedBox(width: 10 * s),
  //             Expanded(child: _zoneChip(chips[1], s)),
  //           ],
  //         ),
  //         SizedBox(height: 10 * s),
  //         Row(
  //           children: [
  //             Expanded(child: _zoneChip(chips[2], s)),
  //             SizedBox(width: 10 * s),
  //             Expanded(child: _zoneChip(chips[3], s)),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _zoneChip(String label, double s) {
  //   bool isSelected = selectedZone == label;

  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedZone = label;
  //         if (label == 'Soft steps') {
  //           showDesignScreen = true;
  //         }
  //       });
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 12 * s, vertical: 8 * s),
  //       decoration: BoxDecoration(
  //         color: isSelected ? const Color(0xFF89B6F8) : Colors.white,
  //         borderRadius: BorderRadius.circular(20 * s),
  //         border: Border.all(
  //           color: isSelected ? const Color(0xFF89B6F8) : Colors.blue.shade100,
  //         ),
  //       ),
  //       child: Text(
  //         label,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontWeight: FontWeight.w600,
  //           fontSize: 13 * s,
  //           color: isSelected ? Colors.white : Colors.black,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildWhenCard(double s) {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(12 * s),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12 * s),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Icon(Icons.calendar_today, color: Colors.blue[900]),
  //             SizedBox(width: 8 * s),
  //             Text(
  //               'WHEN?',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 * s),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 12 * s),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             _dateOption('Today', selectedDateOption == 'Today', s),
  //             SizedBox(height: 10 * s),
  //             _dateOption('Tomorrow', selectedDateOption == 'Tomorrow', s),
  //             SizedBox(height: 10 * s),
  //             _selectDateButton(s),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _selectDateButton(double s) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         showDateSelectionScreen = true;
  //       });
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 12 * s, horizontal: 16 * s),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Text(
  //             selectedDateOption.contains('Jan')
  //                 ? selectedDateOption
  //                 : 'Select a date',
  //             style: TextStyle(
  //               color: selectedDateOption.contains('Jan')
  //                   ? Colors.blue[900]
  //                   : Colors.black54,
  //               fontWeight: selectedDateOption.contains('Jan')
  //                   ? FontWeight.bold
  //                   : FontWeight.normal,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _dateOption(String label, bool selected, double s) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedDateOption = label;
  //       });
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 12 * s, vertical: 8 * s),
  //       child: Text(
  //         label,
  //         style: TextStyle(
  //           color: selected ? Colors.blue[900] : Colors.black54,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildTimeCard(double s) {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(12 * s),
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFEFF6FF),
  //       borderRadius: BorderRadius.circular(12 * s),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Icon(Icons.access_time, color: Colors.blue[900]),
  //             SizedBox(width: 8 * s),
  //             Text('What time?', style: TextStyle(fontWeight: FontWeight.bold)),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildEnableCallCard(double s) {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(12 * s),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12 * s),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Icon(Icons.phone_in_talk, color: Colors.blue[900]),
  //             SizedBox(width: 8 * s),
  //             Text(
  //               'ENABLE CALL',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 10 * s),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 'A real-time 10-min support call will help you stay on track.',
  //                 style: TextStyle(
  //                   fontSize: 12 * s,
  //                   color: Colors.blueGrey[700],
  //                 ),
  //               ),
  //             ),
  //             Switch(
  //               value: isCallEnabled,
  //               onChanged: (value) {
  //                 setState(() {
  //                   isCallEnabled = value;
  //                 });
  //               },
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildRepeatQuestCard(double s) {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(12 * s),
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFE6F0FF),
  //       borderRadius: BorderRadius.circular(12 * s),
  //     ),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'REPEAT QUEST',
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 6 * s),
  //               Text(
  //                 'Turn this on to repeat the quest daily or weekly.',
  //                 style: TextStyle(
  //                   fontSize: 12 * s,
  //                   color: Colors.blueGrey[700],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Switch(
  //           value: _switchValue,
  //           onChanged: (bool newValue) {
  //             setState(() {
  //               _switchValue = newValue;
  //             });
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// class DesignScreen extends StatelessWidget {
//   const DesignScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.92,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFFDF8),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: const [
//               Text("💡", style: TextStyle(fontSize: 22)),
//               SizedBox(width: 6),
//               Expanded(
//                 child: Text(
//                   "Zones show how intense your quest feels. Pick what fits your energy today – we'll track your flow over time.",
//                   style: TextStyle(
//                     fontSize: 16,
//                     height: 1.4,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF1A1A1A),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 14),
//           const BulletText("Soft steps — Gentle & doable"),
//           const BulletText("Elevated — Balanced and steady"),
//           const BulletText("Stretch zone — A bit beyond your comfort"),
//           const BulletText("Power move — Full focus, no distractions"),
//         ],
//       ),
//     );
//   }
// }

// class BulletText extends StatelessWidget {
//   final String text;
//   const BulletText(this.text, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("• ", style: TextStyle(fontSize: 14)),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 14,
//                 height: 1.3,
//                 color: Color(0xFF333333),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DateSelectionScreen extends StatefulWidget {
//   final Function(String day, String weekday) onDateSelected;
//   final VoidCallback onClose;

//   const DateSelectionScreen({
//     super.key,
//     required this.onDateSelected,
//     required this.onClose,
//   });

//   @override
//   State<DateSelectionScreen> createState() => _DateSelectionScreenState();
// }

// class _DateSelectionScreenState extends State<DateSelectionScreen> {
//   int selectedIndex = 2;

//   final dates = [
//     {"day": "06", "weekday": "Monday"},
//     {"day": "07", "weekday": "Tuesday"},
//     {"day": "08", "weekday": "Wednesday"},
//     {"day": "09", "weekday": "Thursday"},
//     {"day": "10", "weekday": "Friday"},
//     {"day": "11", "weekday": "Saturday"},
//     {"day": "12", "weekday": "Sunday"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double cardWidth = constraints.maxWidth * 0.85;

//         return Container(
//           width: cardWidth,
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.95),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Expanded(
//                     child: Text(
//                       "Select a date",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF002D72),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: widget.onClose,
//                     icon: const Icon(Icons.close),
//                     color: Colors.grey[600],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "Only 7 days ahead – because a week is enough to get moving.",
//                 style: TextStyle(fontSize: 14, color: Color(0xFF334155)),
//               ),
//               const SizedBox(height: 24),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF8FAFC),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Text(
//                         "January 2026",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Color(0xFF002D72),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       height: 280,
//                       child: ListView.builder(
//                         itemCount: dates.length,
//                         itemBuilder: (context, i) {
//                           bool selected = selectedIndex == i;
//                           return InkWell(
//                             onTap: () => setState(() => selectedIndex = i),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 10,
//                                 horizontal: 20,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     dates[i]["day"]!,
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                       color: selected
//                                           ? const Color(0xFF4B39EF)
//                                           : Colors.grey[700],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 16),
//                                   Expanded(
//                                     child: Text(
//                                       dates[i]["weekday"]!,
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: selected
//                                             ? FontWeight.w700
//                                             : FontWeight.w500,
//                                         color: selected
//                                             ? const Color(0xFF4B39EF)
//                                             : Colors.grey[700],
//                                       ),
//                                     ),
//                                   ),
//                                   if (selected)
//                                     const Icon(
//                                       Icons.check,
//                                       color: Color(0xFF4B39EF),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     widget.onDateSelected(
//                       dates[selectedIndex]["day"]!,
//                       dates[selectedIndex]["weekday"]!,
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF8A22),
//                     padding: const EdgeInsets.symmetric(vertical: 18),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     "Choose date",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:ui'; // Needed for FontFeature
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TimePickerDemo(),
//     );
//   }
// }
//
// // Example usage
// class TimePickerDemo extends StatelessWidget {
//   const TimePickerDemo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Time Picker'),
//         backgroundColor: Colors.blue[900],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TimePickerCard(scale: 1.0),
//       ),
//     );
//   }
// }

// class TimePickerCard extends StatefulWidget {
//   final double scale;

//   const TimePickerCard({Key? key, this.scale = 1.0}) : super(key: key);

//   @override
//   State<TimePickerCard> createState() => _TimePickerCardState();
// }

// class _TimePickerCardState extends State<TimePickerCard> {
//   bool _isExpanded = false;
//   int _selectedHour = DateTime.now().hour;
//   int _selectedMinute = DateTime.now().minute;
//   int _selectedSecond = DateTime.now().second;
//   bool _isPM = DateTime.now().hour >= 12;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _selectedSecond++;
//         if (_selectedSecond >= 60) {
//           _selectedSecond = 0;
//           _selectedMinute++;
//           if (_selectedMinute >= 60) {
//             _selectedMinute = 0;
//             _selectedHour++;
//             if (_selectedHour >= 24) {
//               _selectedHour = 0;
//             }
//             _isPM = _selectedHour >= 12;
//           }
//         }
//       });
//     });
//   }

//   int get _displayHour {
//     if (_selectedHour == 0) return 12;
//     if (_selectedHour > 12) return _selectedHour - 12;
//     return _selectedHour;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildTimeCard(widget.scale);
//   }

//   Widget _buildTimeCard(double s) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16 * s),
//       decoration: BoxDecoration(
//         color: const Color(0xFFEFF6FF),
//         borderRadius: BorderRadius.circular(12 * s),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _isExpanded = !_isExpanded;
//               });
//             },
//             child: Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(8 * s),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1E3A8A),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.access_time,
//                     color: Colors.white,
//                     size: 20 * s,
//                   ),
//                 ),
//                 SizedBox(width: 8 * s),
//                 Text(
//                   'What time?',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16 * s,
//                     color: const Color(0xFF64748B),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (_isExpanded) ...[SizedBox(height: 16 * s), _buildTimePicker(s)],
//         ],
//       ),
//     );
//   }

//   Widget _buildTimePicker(double s) {
//     return Column(
//       children: [
//         _buildTimeRow(
//           s,
//           (_displayHour - 1) <= 0 ? 12 : _displayHour - 1,
//           (_selectedMinute - 1) < 0 ? 59 : _selectedMinute - 1,
//           (_selectedSecond - 1) < 0 ? 59 : _selectedSecond - 1,
//           !_isPM,
//           isGrayed: true,
//         ),
//         SizedBox(height: 8 * s),
//         Container(height: 1, color: Colors.grey[300]),
//         SizedBox(height: 8 * s),
//         _buildTimeRow(
//           s,
//           _displayHour,
//           _selectedMinute,
//           _selectedSecond,
//           _isPM,
//           isSelected: true,
//         ),
//         SizedBox(height: 8 * s),
//         Container(height: 1, color: Colors.grey[300]),
//         SizedBox(height: 8 * s),
//         _buildTimeRow(
//           s,
//           (_displayHour + 1) > 12 ? 1 : _displayHour + 1,
//           (_selectedMinute + 1) >= 60 ? 0 : _selectedMinute + 1,
//           (_selectedSecond + 1) >= 60 ? 0 : _selectedSecond + 1,
//           _isPM,
//           isGrayed: true,
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeRow(
//     double s,
//     int hour,
//     int minute,
//     int second,
//     bool isPM, {
//     bool isSelected = false,
//     bool isGrayed = false,
//   }) {
//     final textColor = isSelected
//         ? Colors.blue[700]!
//         : isGrayed
//         ? Colors.grey[400]!
//         : Colors.grey[600]!;

//     final fontWeight = isSelected ? FontWeight.bold : FontWeight.normal;
//     final fontSize = isSelected ? 20.0 * s : 16.0 * s;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildTimeUnit(
//           hour.toString().padLeft(2, '0'),
//           textColor,
//           fontWeight,
//           fontSize,
//         ),
//         Text(
//           ' : ',
//           style: TextStyle(
//             color: textColor,
//             fontWeight: fontWeight,
//             fontSize: fontSize,
//           ),
//         ),
//         _buildTimeUnit(
//           minute.toString().padLeft(2, '0'),
//           textColor,
//           fontWeight,
//           fontSize,
//         ),
//         Text(
//           ' : ',
//           style: TextStyle(
//             color: textColor,
//             fontWeight: fontWeight,
//             fontSize: fontSize,
//           ),
//         ),
//         _buildTimeUnit(
//           second.toString().padLeft(2, '0'),
//           textColor,
//           fontWeight,
//           fontSize,
//         ),
//         SizedBox(width: 16 * s),
//         GestureDetector(
//           onTap: isSelected
//               ? () {
//                   setState(() {
//                     _isPM = !_isPM;
//                     if (_isPM) {
//                       _selectedHour = _selectedHour < 12
//                           ? _selectedHour + 12
//                           : _selectedHour;
//                     } else {
//                       _selectedHour = _selectedHour >= 12
//                           ? _selectedHour - 12
//                           : _selectedHour;
//                     }
//                   });
//                 }
//               : null,
//           child: Text(
//             isPM ? 'PM' : 'AM',
//             style: TextStyle(
//               color: textColor,
//               fontWeight: fontWeight,
//               fontSize: fontSize,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTimeUnit(
//     String value,
//     Color color,
//     FontWeight weight,
//     double size,
//   ) {
//     return Text(
//       value,
//       style: TextStyle(
//         color: color,
//         fontWeight: weight,
//         fontSize: size,
//         fontFeatures: const [FontFeature.tabularFigures()],
//       ),
//     );
//   }
// }
