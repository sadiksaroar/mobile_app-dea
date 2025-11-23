// import 'package:flutter/material.dart';

// class SelectZoneCard extends StatefulWidget {
//   final double scale;

//   const SelectZoneCard({Key? key, this.scale = 1.0}) : super(key: key);

//   @override
//   _SelectZoneCardState createState() => _SelectZoneCardState();
// }

// class _SelectZoneCardState extends State<SelectZoneCard> {
//   String? selectedZone;
//   bool showDesignScreen = false;

//   final List<String> chips = [
//     'Soft steps',
//     'Elevated',
//     'Stretch zone',
//     'Power move',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double s = widget.scale;

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(12 * s),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE6F0FF),
//         borderRadius: BorderRadius.circular(12 * s),
//       ),
//       child: Column(
//         children: [
//           // Header
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.bar_chart, color: Colors.blue[900]),
//                   SizedBox(width: 8 * s),
//                   Text(
//                     'SELECT A ZONE',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14 * s,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6 * s),
//               Text(
//                 "Label how demanding this feels - \nit helps track your progress over time.",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10 * s),
//               ),
//             ],
//           ),
//           SizedBox(height: 14 * s),
//           // Chips in two rows
//           Row(
//             children: [
//               Expanded(child: _zoneChip(chips[0], s)),
//               SizedBox(width: 10 * s),
//               Expanded(child: _zoneChip(chips[1], s)),
//             ],
//           ),
//           SizedBox(height: 10 * s),
//           Row(
//             children: [
//               Expanded(child: _zoneChip(chips[2], s)),
//               SizedBox(width: 10 * s),
//               Expanded(child: _zoneChip(chips[3], s)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _zoneChip(String label, double s) {
//     bool isSelected = selectedZone == label;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedZone = label;
//           showDesignScreen = label == 'Soft steps';
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12 * s, vertical: 8 * s),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFF89B6F8) : Colors.white,
//           borderRadius: BorderRadius.circular(20 * s),
//           border: Border.all(
//             color: isSelected ? const Color(0xFF89B6F8) : Colors.blue.shade100,
//           ),
//         ),
//         child: Text(
//           label,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 13 * s,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
import 'package:flutter/material.dart';

class SelectZoneCard extends StatefulWidget {
  final double scale;

  const SelectZoneCard({Key? key, this.scale = 1.0}) : super(key: key);

  @override
  _SelectZoneCardState createState() => _SelectZoneCardState();
}

class _SelectZoneCardState extends State<SelectZoneCard> {
  String? selectedZone;
  bool showDesignScreen = false;

  final List<String> chips = [
    'Soft steps',
    'Elevated',
    'Stretch zone',
    'Power move',
  ];

  @override
  Widget build(BuildContext context) {
    double s = widget.scale;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12 * s),
          decoration: BoxDecoration(
            color: const Color(0xFFE6F0FF),
            borderRadius: BorderRadius.circular(12 * s),
          ),
          child: Column(
            children: [
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.bar_chart,
                        color: Colors.blue[900],
                        size: 20 * s,
                      ),
                      SizedBox(width: 8 * s),
                      Text(
                        'SELECT A ZONE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14 * s,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6 * s),
                  Text(
                    "Label how demanding this feels - \nit helps track your progress over time.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10 * s,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14 * s),
              // Chips in two rows
              Row(
                children: [
                  Expanded(child: _zoneChip(chips[0], s)),
                  SizedBox(width: 10 * s),
                  Expanded(child: _zoneChip(chips[1], s)),
                ],
              ),
              SizedBox(height: 10 * s),
              Row(
                children: [
                  Expanded(child: _zoneChip(chips[2], s)),
                  SizedBox(width: 10 * s),
                  Expanded(child: _zoneChip(chips[3], s)),
                ],
              ),
            ],
          ),
        ),
        // Show DesignScreen when 'Soft steps' is selected
        if (showDesignScreen) ...[
          SizedBox(height: 16 * s),
          const DesignScreen(),
        ],
      ],
    );
  }

  Widget _zoneChip(String label, double s) {
    bool isSelected = selectedZone == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedZone = label;
          showDesignScreen = label == 'Soft steps';
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12 * s, vertical: 8 * s),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF89B6F8) : Colors.white,
          borderRadius: BorderRadius.circular(20 * s),
          border: Border.all(
            color: isSelected ? const Color(0xFF89B6F8) : Colors.blue.shade100,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13 * s,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class DesignScreen extends StatelessWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Text("💡", style: TextStyle(fontSize: 22)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Zones show how intense your quest feels. Pick what fits your energy today – we'll track your flow over time.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          BulletText("Soft steps — Gentle & doable"),
          BulletText("Elevated — Balanced and steady"),
          BulletText("Stretch zone — A bit beyond your comfort"),
          BulletText("Power move — Full focus, no distractions"),
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.3,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
