// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';
// import 'package:mobile_app_dea/widget/custom_button.dart';

// class Animation extends StatelessWidget {
//   const Animation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFCF1), // light cream background
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: SvgPicture.asset(
//             Assets.svgIcons.backIconSvg.path,
//             height: 54,
//             width: 54,
//           ),
//           onPressed: () {
//             // Navigator.pop(context);
//             context.pop("/nowliHowToUse");
//           },
//         ),
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: LinearProgressIndicator(
//                     value: 5 / 6,
//                     backgroundColor: Colors.grey[300],
//                     color: const Color(0xFF4B9EFF),
//                     minHeight: 6,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 0),
//               Text("Skip", style: AppsTextStyles.letsStartNext),
//             ],
//           ),
//         ),
//         titleSpacing: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             Text(
//               "LET'S SHAPE YOUR NOWLII",
//               style: AppsTextStyles.black24Uppercase,
//             ),
//             const SizedBox(height: 6),
//             Text(
//               "Give it a form so we can face it, instead of chase it!",
//               style: AppsTextStyles.PasswordUpdateSub,
//             ),
//             const SizedBox(height: 20),
//             // 6 Lottie items (Grid layout)
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//                 children: [
//                   buildLottieBox(
//                     'assets/lottie_animations/A fitness cow.json',
//                     isSelected: true,
//                     color: const Color(0xFF011F54),
//                   ),
//                   buildLottieBox(
//                     'assets/lottie_animations/Dancing llama.json',
//                     color: const Color(0xFFFF8F26),
//                   ),
//                   buildLottieBox(
//                     'assets/lottie_animations/Easter Bunny Boy waving.json',
//                     color: const Color(0xFFFAE3CE),
//                   ),
//                   buildLottieBox(
//                     'assets/lottie_animations/Food loading.json',
//                     color: const Color(0xFFDFEFFF),
//                   ),
//                   buildLottieBox(
//                     'assets/lottie_animations/Sandy Loading.json',
//                     color: const Color(0xFF4542EB),
//                   ),
//                   buildLottieBox(
//                     'assets/lottie_animations/Watermelon Fixing.json',
//                     color: const Color(0xFF89D6C0),
//                   ),
//                 ],
//               ),
//             ),

//             CustomNextButton(
//               isEnabled: true,
//               onTap: () {
//                 context.push("/onboardingScreen");
//               },
//               buttonText: "Next",
//               iconPath: Assets.svgIcons.startLetsGo.path,
//               textStyle: AppsTextStyles.letsStartNext,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildLottieBox(String path, {bool isSelected = false, Color? color}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: color ?? Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: isSelected
//             ? Border.all(color: Colors.blueAccent, width: 3)
//             : null,
//       ),
//       child: Center(
//         child: Lottie.asset(path, width: 110, height: 110, fit: BoxFit.contain),
//       ),
//     );
//   }
// }
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class Animation extends StatefulWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8ED),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button, progress bar, and skip
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      Assets.svgIcons.backIconSvg.path,
                      height: 64,
                      width: 64,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4B7BF5),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '5/6',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 16),
                  Text('Skip', style: AppsTextStyles.letsStartNext),
                ],
              ),
            ),

            // Title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LET'S SHAPE YOUR NOWLI!",
                    style: AppsTextStyles.black24Uppercase,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Give it a form so we can face it, instead of chase it!',
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w400, // Regular
                      color: const Color(0xFF595754),
                      height: 1.4, // line-height: 140%
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Character grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1.4,
                  children: [
                    _buildCharacterCard(0, 'assets/svg_images/A.png'),
                    _buildCharacterCard(1, 'assets/svg_images/B.png'),
                    _buildCharacterCard(2, 'assets/svg_images/C.png'),
                    _buildCharacterCard(3, 'assets/svg_images/D.png'),
                    _buildCharacterCard(4, 'assets/svg_images/E.png'),
                    _buildCharacterCard(5, 'assets/svg_images/F.png'),
                  ],
                ),
              ),
            ),

            // Next button
            CustomNextButton(
              isEnabled: true,
              onTap: () {
                context.push("/onboardingScreen");
              },
              buttonText: "Next",
              iconPath: Assets.svgIcons.startLetsGo.path,
              textStyle: AppsTextStyles.letsStartNext,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(int index, String imagePath) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF4B7BF5) : Colors.transparent,
            width: 8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class Animation extends StatefulWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8ED),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button, progress bar, and skip
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      Assets.svgIcons.backIconSvg.path,
                      height: 64,
                      width: 64,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4B7BF5),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '5/6',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 16),
                  Text('Skip', style: AppsTextStyles.letsStartNext),
                ],
              ),
            ),

            // Title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LET'S SHAPE YOUR NOWLI!",
                    style: AppsTextStyles.black24Uppercase,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Give it a form so we can face it, instead of chase it!',
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF595754),
                      height: 1.4,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Character grid - Non-scrollable
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildCharacterCard(
                              0,
                              'assets/svg_images/A.png',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildCharacterCard(
                              1,
                              'assets/svg_images/B.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildCharacterCard(
                              2,
                              'assets/svg_images/C.png',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildCharacterCard(
                              3,
                              'assets/svg_images/D.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildCharacterCard(
                              4,
                              'assets/svg_images/E.png',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildCharacterCard(
                              5,
                              'assets/svg_images/F.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Next button
            CustomNextButton(
              isEnabled: true,
              onTap: () {
                context.push("/onboardingScreen");
              },
              buttonText: "Next",
              iconPath: Assets.svgIcons.startLetsGo.path,
              textStyle: AppsTextStyles.letsStartNext,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(int index, String imagePath) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF4B7BF5) : Colors.transparent,
            width: 8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
  // Widget _buildCharacterCard(int index, String imagePath) {
  //   final isSelected = selectedIndex == index;

  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedIndex = index;
  //       });
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           color: isSelected ? const Color(0xFF4B7BF5) : Colors.transparent,
  //           width: 8,
  //         ),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.1),
  //             blurRadius: 10,
  //             offset: const Offset(0, 4),
  //           ),
  //         ],
  //       ),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(16),
  //         child: Image.asset(imagePath, fit: BoxFit.cover),
  //       ),
  //     ),
  //   );
  // }
}
