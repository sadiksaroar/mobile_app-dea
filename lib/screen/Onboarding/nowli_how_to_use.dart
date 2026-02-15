// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';
// import 'package:mobile_app_dea/widget/custom_button.dart';

// class NowliHowToUse extends StatelessWidget {
//   const NowliHowToUse({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Define responsive sizes
//     final backIconSize = screenWidth * 0.08;
//     final progressHeight = screenWidth * 0.015;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Top Row: Back, Progress, Skip
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Back button
//                       GestureDetector(
//                         onTap: () {
//                           context.push("/onbordingFetures");
//                         },
//                         child: SizedBox(
//                           height: 57,
//                           width: 57,
//                           child: CircleAvatar(
//                             backgroundColor: const Color(0xFFFFF1E8),
//                             child: Assets.svgIcons.backIconPng.image(
//                               height: 24,
//                               width: 24,
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(width: screenWidth * 0.03),

//                       // Progress bar
//                       Expanded(
//                         child: Container(
//                           height: progressHeight,
//                           decoration: ShapeDecoration(
//                             color: const Color(0xFFC3DBFF),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(999),
//                             ),
//                           ),
//                           child: FractionallySizedBox(
//                             alignment: Alignment.centerLeft,
//                             widthFactor: 0.5, // 3/6 = 0.5
//                             child: Container(
//                               decoration: ShapeDecoration(
//                                 color: const Color(0xFF3D87F5),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(999),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(width: screenWidth * 0.015),

//                       // Progress text
//                       Text(
//                         '4/6',
//                         style: TextStyle(
//                           color: const Color(0xFF4C586E),
//                           fontSize: 12,
//                           fontFamily: 'Work Sans',
//                           fontWeight: FontWeight.w400,
//                           height: 1.40,
//                         ),
//                       ),

//                       SizedBox(width: screenWidth * 0.03),

//                       // Skip button - Fixed navigation
//                       GestureDetector(
//                         onTap: () {
//                           context.push("/animation"); // Skip to next screen
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: screenWidth * 0.02,
//                             vertical: screenWidth * 0.015,
//                           ),
//                           child: Text(
//                             'Skip',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: const Color(0xFF011F54),
//                               fontSize: (screenWidth * 0.042).clamp(14.0, 18.0),
//                               fontFamily: 'Work Sans',
//                               fontWeight: FontWeight.w900,
//                               height: 0.80,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30),

//                   // Card with icon and text
//                   Container(
//                     height: 220,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFA0E871),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           // width: 100,
//                           // height: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Assets.svgIcons.nowliHowToUse.svg(
//                             height: 160,
//                             width: 130,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: RichText(
//                             text: TextSpan(
//                               style: GoogleFonts.workSans(
//                                 fontWeight: FontWeight.w800, // ExtraBold
//                                 fontSize: 17,
//                                 height: 1.4, // line-height: 140%
//                                 letterSpacing: -0.5, // -0.5px
//                                 color: const Color(0xFF011F54), // #011F54
//                               ),
//                               children: const [
//                                 TextSpan(
//                                   text:
//                                       "Nowlii is like a car, it is your tool that will bring you where you are headed to! ",
//                                 ),
//                                 TextSpan(
//                                   text: "✨",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 TextSpan(
//                                   text:
//                                       " like a domino effect in your life actions.",
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   SizedBox(
//                     width: 329,
//                     child: Text(
//                       'Our biggest goal is you to stop to use Nowlii after 12 months. ',
//                       style: TextStyle(
//                         color: const Color(0xFF011F54),
//                         fontSize: 22.31,
//                         fontFamily: 'Work Sans',
//                         fontWeight: FontWeight.w800,
//                         height: 1.40,
//                         letterSpacing: -0.56,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Spacer to push content up
//                   const Expanded(child: SizedBox()),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),

//           // Bottom Sheet
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               constraints: BoxConstraints(maxHeight: screenHeight * 0.5),
//               padding: const EdgeInsets.all(24),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF4542EB),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "SOME OF OUR TIPS AND TRICKS HOW TO USE NOWLII 📖",
//                       style: AppsTextStyles.black24UppercaseSome,
//                     ),
//                     const SizedBox(height: 16),
//                     RichText(
//                       text: TextSpan(
//                         style: AppsTextStyles.regular18.copyWith(
//                           color: Colors.white,
//                         ),
//                         children: [
//                           const TextSpan(
//                             text:
//                                 "We recommend booking the call with Nowlii when you are setting an alarm at night, ",
//                           ),
//                           TextSpan(
//                             text: "10 minutes after the alarm",
//                             style: AppsTextStyles.semiBold18.copyWith(
//                               color: Colors.white,
//                             ),
//                           ),
//                           const TextSpan(
//                             text:
//                                 " so Nowlii will be there to start the day with you ✨",
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     CustomNextButton(
//                       isEnabled: true,
//                       onTap: () {
//                         context.push("/animation");
//                       },
//                       buttonText: "Next",
//                       iconPath: Assets.svgIcons.startLetsGo.path,
//                       textStyle: AppsTextStyles.letsStartNext,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class NowliHowToUse extends StatelessWidget {
  const NowliHowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamic sizes
    final backIconSize = screenWidth * 0.08;
    final progressHeight = screenWidth * 0.015;
    final horizontalPadding = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.push("/onbordingFetures"),
                        child: SizedBox(
                          height: backIconSize * 2,
                          width: backIconSize * 2,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFFFFF1E8),
                            child: Assets.svgIcons.backIconPng.image(
                              height: backIconSize,
                              width: backIconSize,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.03),

                      // Progress bar
                      Expanded(
                        child: Container(
                          height: progressHeight,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC3DBFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.5,
                            child: Container(
                              decoration: ShapeDecoration(
                                color: const Color(0xFF3D87F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.015),

                      Text(
                        '4/6',
                        style: TextStyle(
                          color: const Color(0xFF4C586E),
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.03),

                      GestureDetector(
                        onTap: () => context.push("/animation"),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.025,
                            vertical: screenWidth * 0.015,
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: const Color(0xFF011F54),
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Card with icon and text
                  Container(
                    height: screenHeight * 0.25,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA0E871),
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ),
                          ),
                          child: Assets.svgIcons.nowliHowToUse.svg(
                            height: 130,
                            width: 115,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: SizedBox(
                            width: 194,
                            child: Text(
                              'Nowlii is like a car, it is your toll that will bring where you are headed to! 🌱 like a domino effect in your life actions.',
                              style: GoogleFonts.workSans(
                                color: const Color(
                                  0xFF011F54,
                                ), // Text-text-default
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),
                          //   child: RichText(
                          //     text: TextSpan(
                          //       style: GoogleFonts.workSans(
                          //         fontWeight: FontWeight.w800,
                          //         fontSize: screenWidth * 0.045,
                          //         height: 1.4,
                          //         color: const Color(0xFF011F54),
                          //       ),
                          //       children: const [
                          //         TextSpan(
                          //           text:
                          //               "Nowlii is like a car, it is your tool that will bring you where you are headed to! ",
                          //         ),
                          //         TextSpan(
                          //           text: "✨",
                          //           style: TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //         TextSpan(
                          //           text:
                          //               " like a domino effect in your life actions.",
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Text(
                      'Our biggest goal is you to stop to use Nowlii after 12 months.',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        height: 1.4,
                        color: const Color(0xFF011F54),
                      ),
                    ),
                  ),

                  // Spacer pushes content up
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),

          // Bottom Sheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              constraints: BoxConstraints(maxHeight: screenHeight * 0.55),
              padding: EdgeInsets.all(screenWidth * 0.06),
              decoration: BoxDecoration(
                color: const Color(0xFF4542EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.06),
                  topRight: Radius.circular(screenWidth * 0.06),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 331,
                      child: Text(
                        'SOME OF OUR TIPS AND TRICKS HOW TO USE NOWLII 🛋️💡',
                        style: GoogleFonts.workSans(
                          color: const Color(0xFFFFFCF1),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          height: 0.90,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      width: 331,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'We recommend booking the call with Nowlii when you are putting an alarm at night,',
                              style: GoogleFonts.workSans(
                                color: const Color(0xFFFFFCF1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                            TextSpan(
                              text: ' 10 minutes after the alarm',
                              style: GoogleFonts.workSans(
                                color: const Color(0xFFFFFCF1),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' so Nowlii will be there to start the day with you ✨',
                              style: GoogleFonts.workSans(
                                color: const Color(0xFFFFFCF1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // RichText(
                    //   text: TextSpan(
                    //     style: AppsTextStyles.regular18.copyWith(
                    //       color: Colors.white,
                    //       fontSize: screenWidth * 0.042,
                    //     ),
                    //     children: [
                    //       const TextSpan(
                    //         text:
                    //             "We recommend booking the call with Nowlii when you are setting an alarm at night, ",
                    //       ),
                    //       TextSpan(
                    //         text: "10 minutes after the alarm",
                    //         style: AppsTextStyles.semiBold18.copyWith(
                    //           color: Colors.white,
                    //           fontSize: screenWidth * 0.042,
                    //         ),
                    //       ),
                    //       const TextSpan(
                    //         text:
                    //             " so Nowlii will be there to start the day with you ✨",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomNextButton(
                      isEnabled: true,
                      onTap: () => context.push("/animation"),
                      buttonText: "Next",
                      iconPath: Assets.svgIcons.startLetsGo.path,
                      textStyle: AppsTextStyles.letsStartNext.copyWith(
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class NowliHowToUse extends StatelessWidget {
  const NowliHowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamic sizes
    final backIconSize = screenWidth * 0.08;
    final progressHeight = screenWidth * 0.015;
    final horizontalPadding = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.push("/onbordingFetures"),
                        child: SizedBox(
                          height: backIconSize * 2,
                          width: backIconSize * 2,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFFFFF1E8),
                            child: Assets.svgIcons.backIconPng.image(
                              height: backIconSize,
                              width: backIconSize,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.03),

                      // Progress bar
                      Expanded(
                        child: Container(
                          height: progressHeight,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC3DBFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.5,
                            child: Container(
                              decoration: ShapeDecoration(
                                color: const Color(0xFF3D87F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.015),

                      Text(
                        '4/6',
                        style: TextStyle(
                          color: const Color(0xFF4C586E),
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.03),

                      GestureDetector(
                        onTap: () => context.push("/animation"),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.025,
                            vertical: screenWidth * 0.015,
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: const Color(0xFF011F54),
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Card with icon and text
                  Container(
                    height: screenHeight * 0.25,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA0E871),
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ),
                          ),
                          child: Assets.svgIcons.nowliHowToUse.svg(
                            height: 130,
                            width: 115,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: SizedBox(
                            width: 194,
                            child: Text(
                              'Nowlii is like a car, it is your toll that will bring where you are headed to! 🌱 like a domino effect in your life actions.',
                              style: GoogleFonts.workSans(
                                color: const Color(
                                  0xFF011F54,
                                ), // Text-text-default
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Responsive spacing - changed from fixed 40 to screen-based
                  SizedBox(height: screenHeight * 0.04),

                  // Added padding for better alignment and responsive font size
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      child: Text(
                        'Our biggest goal is you to stop to use Nowlii after 12 months.',
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w900,
                          fontSize: screenWidth * 0.052, // Responsive font size
                          height: 1.4,
                          color: const Color(0xFF011F54),
                        ),
                      ),
                    ),
                  ),

                  // Added bottom spacing before the Expanded widget
                  SizedBox(height: screenHeight * 0.02),

                  // Spacer pushes content up
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),

          // Bottom Sheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              constraints: BoxConstraints(maxHeight: screenHeight * 0.55),
              padding: EdgeInsets.all(screenWidth * 0.06),
              decoration: BoxDecoration(
                color: const Color(0xFF4542EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.06),
                  topRight: Radius.circular(screenWidth * 0.06),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 331,
                      child: Text(
                        'SOME OF OUR TIPS AND TRICKS HOW TO USE NOWLII 🛋️💡',
                        style: GoogleFonts.workSans(
                          color: const Color(0xFFFFFCF1),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          height: 0.90,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      width: 331,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'We recommend booking the call with Nowlii when you are putting an alarm at night,',
                              style: GoogleFonts.workSans(
                                color: const Color(0xFFFFFCF1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                            TextSpan(
                              text: ' 10 minutes after the alarm',
                              style: GoogleFonts.workSans(
                                color: const Color(0xFFFFFCF1),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' so Nowlii will be there to start the day with you ✨',
                              style: GoogleFonts.workSans(
                                color: const Color(0xFFFFFCF1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.40,
                                letterSpacing: -0.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomNextButton(
                      isEnabled: true,
                      onTap: () => context.push("/animation"),
                      buttonText: "Next",
                      iconPath: Assets.svgIcons.startLetsGo.path,
                      textStyle: AppsTextStyles.letsStartNext.copyWith(
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
