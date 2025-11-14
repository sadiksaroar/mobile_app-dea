// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';

// class OnboardingFeatures extends StatelessWidget {
//   const OnboardingFeatures({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top navigation & progress
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const CircleAvatar(
//                     backgroundColor: Color(0xFFFFF1E8),
//                     child: Icon(Icons.arrow_back, color: Colors.black),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: LinearProgressIndicator(
//                         value: 3 / 6,
//                         color: Colors.blue,
//                         backgroundColor: Colors.blue[100],
//                       ),
//                     ),
//                   ),
//                   Text(
//                     "Skip",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               const Text(
//                 "MEET NOWLII",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 24),

//               // Cards
//               Expanded(
//                 child: ListView(
//                   children: [
//                     buildCard(
//                       color: Colors.blue[300]!,
//                       svgPath: Assets.svgIcons.realCompany.path,
//                       title: "REAL COMPANY",
//                       description:
//                           "Nowlii is your always-available friend. Here for you - anytime, anywhere.",
//                     ),
//                     buildCard(
//                       color: Colors.orange[400]!,
//                       svgPath: Assets.svgIcons.dAILYMOMENTSPng.path,
//                       title: "DAILY MOMENTS",
//                       description:
//                           "Whether you're walking, shopping, or hitting the gym - Nowlii joins in.",
//                     ),
//                     buildCard(
//                       color: Colors.green[400]!,
//                       svgPath: Assets.svgIcons.emotionalSupport.path,
//                       title: "EMOTIONAL SUPPORT",
//                       description:
//                           "Low on motivation? Feeling alone? Nowlii listens, nudges, and cheers you on.",
//                     ),
//                   ],
//                 ),
//               ),

//               // Bottom button
//               SizedBox(
//                 width: double.infinity,
//                 height: 56,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange[400],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Let's start",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       SvgPicture.asset(
//                         Assets.svgIcons.startLetsGo.path,
//                         width: 24,
//                         height: 24,
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

//   Widget buildCard({
//     required Color color,
//     required String svgPath,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 28,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SvgPicture.asset(svgPath, width: 35, height: 50),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: const TextStyle(fontSize: 14, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class OnbordingFetures extends StatelessWidget {
  const OnbordingFetures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top navigation & progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFFFF1E8),
                    child: SvgPicture.asset(Assets.svgIcons.backIcon.path),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: LinearProgressIndicator(
                        value: 3 / 6,
                        color: Colors.blue,
                        backgroundColor: Colors.blue[100],
                      ),
                    ),
                  ),
                  Text(
                    "Skip",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text("MEET NOWLII", style: AppsTextStyles.black24Uppercase),
              const SizedBox(height: 24),

              // Cards
              Expanded(
                child: ListView(
                  children: [
                    buildCard(
                      color: Colors.blue[300]!,
                      svgPath: Assets.svgIcons.realCompany.path,
                      title: "REAL COMPANY",
                      description:
                          "Nowlii is your always-available friend. Here for you - anytime, anywhere.",
                    ),
                    buildCard(
                      color: Colors.orange[400]!,
                      svgPath: Assets.svgIcons.dailyMoments.path,
                      title: "DAILY MOMENTS",
                      description:
                          "Whether you're walking, shopping, or hitting the gym - Nowlii joins in.",
                    ),
                    buildCard(
                      color: Colors.green[400]!,
                      svgPath: Assets.svgIcons.emotionalSupport.path,
                      title: "EMOTIONAL SUPPORT",
                      description:
                          "Low on motivation? Feeling alone? Nowlii listens, nudges, and cheers you on.",
                    ),
                  ],
                ),
              ),

              // Bottom button
              SizedBox(
                width: double.infinity,
                height: 104,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to next screen
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let's start",
                        style:
                            AppsTextStyles.letsStartNext ??
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 30),
                      SvgPicture.asset(
                        Assets.svgIcons.startLetsGo.path,
                        width: 60,
                        height: 60,
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

  Widget buildCard({
    required Color color,
    required String svgPath,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgPath, width: 108, height: 108),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      AppsTextStyles.regular32Uppercase ??
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style:
                      AppsTextStyles.regular16l ??
                      const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
