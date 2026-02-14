// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';
// import 'package:mobile_app_dea/widget/custom_button.dart';

// class OnboardingFeatures extends StatelessWidget {
//   const OnboardingFeatures({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Top bar with new design
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Back button
//                   GestureDetector(
//                     onTap: () => context.push("/onboardingFlow"),
//                     child: CircleAvatar(
//                       child: SvgPicture.asset(
//                         Assets.svgIcons.backIconSvg.path,
//                         width: 59,
//                         height: 59,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),

//                   // Progress bar
//                   Expanded(
//                     child: Container(
//                       height: 8,
//                       decoration: ShapeDecoration(
//                         color: const Color(0xFFC3DBFF),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(999),
//                         ),
//                       ),
//                       child: FractionallySizedBox(
//                         alignment: Alignment.centerLeft,
//                         widthFactor: 0.5, // 3/6 = 0.5
//                         child: Container(
//                           decoration: ShapeDecoration(
//                             color: const Color(0xFF3D87F5),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(999),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(width: 8),

//                   // Progress text
//                   const Text(
//                     '3/6',
//                     style: TextStyle(
//                       color: Color(0xFF4C586E),
//                       fontSize: 12,
//                       fontFamily: 'Work Sans',
//                       fontWeight: FontWeight.w400,
//                       height: 1.40,
//                     ),
//                   ),

//                   const SizedBox(width: 16),

//                   // Skip button
//                   GestureDetector(
//                     onTap: () {
//                       // Skip to next screen
//                       context.push("/nowliHowToUse");
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       child: const Text(
//                         'Skip',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Color(0xFF011F54),
//                           fontSize: 18,
//                           fontFamily: 'Work Sans',
//                           fontWeight: FontWeight.w900,
//                           height: 0.80,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 24),
//               Text("MEET NOWLII", style: AppsTextStyles.black24Uppercase),
//               const SizedBox(height: 24),

//               /// Feature cards
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   children: [
//                     buildCard(
//                       color: Colors.blue.shade300,
//                       svgPath: Assets.svgIcons.realCompany.path,
//                       title: "REAL COMPANY",
//                       description:
//                           "Nowlii is your always-available friend. Here for you - anytime, anywhere.",
//                     ),
//                     buildCard(
//                       color: Colors.orange.shade400,
//                       svgPath: Assets.svgIcons.dailyMoments.path,
//                       title: "DAILY MOMENTS",
//                       description:
//                           "Whether you're walking, shopping, or hitting the gym - Nowlii joins in.",
//                     ),
//                     buildCard(
//                       color: Colors.green.shade400,
//                       svgPath: Assets.svgIcons.emotionalSupport.path,
//                       title: "EMOTIONAL SUPPORT",
//                       description:
//                           "Low on motivation? Feeling alone? Nowlii listens, nudges, and cheers you on.",
//                     ),
//                   ],
//                 ),
//               ),

//               /// CTA Button
//               CustomNextButton(
//                 isEnabled: true,
//                 onTap: () => context.push("/nowliHowToUse"),
//                 buttonText: "Let's start",
//                 iconPath: Assets.svgIcons.startLetsGo.path,
//                 textStyle: AppsTextStyles.letsStartNext,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   static Widget buildCard({
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
//           SvgPicture.asset(svgPath, width: 90, height: 90),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Color(0xFF011F54),
//                     fontSize: 28,
//                     fontFamily: 'Wosker',
//                     fontWeight: FontWeight.w400,
//                     height: 1.1,
//                     letterSpacing: 0.6,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(description, style: AppsTextStyles.regular16l),
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
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class OnboardingFeatures extends StatelessWidget {
  const OnboardingFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    // Responsive padding and spacing
    final horizontalPadding = screenWidth * 0.04; // 4% of width
    final verticalSpacing = screenHeight * 0.02; // 2% of height

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding.clamp(12.0, 20.0),
            vertical: verticalSpacing.clamp(8.0, 16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top bar with responsive design
              _buildTopBar(context, screenWidth),

              SizedBox(height: screenHeight * 0.025),

              Text("MEET NOWLII", style: AppsTextStyles.black24Uppercase),

              SizedBox(height: screenHeight * 0.02),

              /// Feature cards with responsive sizing
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        buildCard(
                          context: context,
                          color: Colors.blue.shade300,
                          svgPath: Assets.svgIcons.realCompany.path,
                          title: "REAL COMPANY",
                          description:
                              "Nowlii is your always-available friend. Here for you - anytime, anywhere.",
                          availableWidth: constraints.maxWidth,
                        ),
                        buildCard(
                          context: context,
                          color: Colors.orange.shade400,
                          svgPath: Assets.svgIcons.dailyMoments.path,
                          title: "DAILY MOMENTS",
                          description:
                              "Whether you're walking, shopping, or hitting the gym - Nowlii joins in.",
                          availableWidth: constraints.maxWidth,
                        ),
                        buildCard(
                          context: context,
                          color: Colors.green.shade400,
                          svgPath: Assets.svgIcons.emotionalSupport.path,
                          title: "EMOTIONAL SUPPORT",
                          description:
                              "Low on motivation? Feeling alone? Nowlii listens, nudges, and cheers you on.",
                          availableWidth: constraints.maxWidth,
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: screenHeight * 0.015),

              /// CTA Button
              CustomNextButton(
                isEnabled: true,
                onTap: () => context.push("/nowliHowToUse"),
                buttonText: "Let's start",
                iconPath: Assets.svgIcons.startLetsGo.path,
                textStyle: AppsTextStyles.letsStartNext,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, double screenWidth) {
    // Responsive icon sizes
    final backIconSize = (screenWidth * 0.12).clamp(45.0, 59.0);
    final progressHeight = (screenWidth * 0.015).clamp(6.0, 8.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Back button
        GestureDetector(
          onTap: () => context.push("/onboardingFlow"),
          child: SizedBox(
            width: 57,
            height: 57,
            child: SvgPicture.asset(
              Assets.svgIcons.backIconSvg.path,
              fit: BoxFit.contain,
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
              widthFactor: 0.5, // 3/6 = 0.5
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

        // Progress text
        Text(
          '3/6',
          style: TextStyle(
            color: const Color(0xFF4C586E),
            fontSize: 12,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w400,
            height: 1.40,
          ),
        ),

        SizedBox(width: screenWidth * 0.03),

        // Skip button
        GestureDetector(
          onTap: () {
            context.push("/nowliHowToUse");
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenWidth * 0.015,
            ),
            child: Text(
              'Skip',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF011F54),
                fontSize: 18,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w900,
                height: 0.80,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildCard({
    required BuildContext context,
    required Color color,
    required String svgPath,
    required String title,
    required String description,
    required double availableWidth,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing for card elements
    final cardVerticalMargin = (screenHeight * 0.008).clamp(6.0, 10.0);
    final cardPadding = (availableWidth * 0.035).clamp(12.0, 16.0);
    final iconSize = (availableWidth * 0.18).clamp(70.0, 90.0);
    final titleFontSize = (availableWidth * 0.065).clamp(22.0, 28.0);
    final spaceBetween = (availableWidth * 0.035).clamp(12.0, 16.0);

    return Container(
      height: 180,

      margin: EdgeInsets.symmetric(vertical: cardVerticalMargin),
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            svgPath,

            // width: 97,
            width: 97,

            height: 97,
            fit: BoxFit.contain,
          ),
          SizedBox(width: spaceBetween),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF011F54),
                    fontSize: titleFontSize,
                    fontFamily: 'Wosker',
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                    letterSpacing: 0.6,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  description,
                  style: GoogleFonts.workSans(
                    color: const Color(0xFF011F54), // Background-bg-dark
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                    letterSpacing: -0.50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
