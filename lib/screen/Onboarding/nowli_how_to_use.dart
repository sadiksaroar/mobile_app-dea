import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    // Define responsive sizes
    final backIconSize = screenWidth * 0.08;
    final progressHeight = screenWidth * 0.015;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Back, Progress, Skip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () {
                          context.push("/onbordingFetures");
                        },
                        child: SizedBox(
                          height: 57,
                          width: 57,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFFFFF1E8),
                            child: Assets.svgIcons.backIconPng.image(
                              height: 24,
                              width: 24,
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
                        '4/6',
                        style: TextStyle(
                          color: const Color(0xFF4C586E),
                          fontSize: 12,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.03),

                      // Skip button - Fixed navigation
                      GestureDetector(
                        onTap: () {
                          context.push("/animation"); // Skip to next screen
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
                              fontSize: (screenWidth * 0.042).clamp(14.0, 18.0),
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w900,
                              height: 0.80,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Card with icon and text
                  Container(
                    height: 220,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA0E871),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          // width: 100,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Assets.svgIcons.nowliHowToUse.svg(
                            height: 220,
                            width: 140,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w800, // ExtraBold
                                fontSize: 20,
                                height: 1.4, // line-height: 140%
                                letterSpacing: -0.5, // -0.5px
                                color: const Color(0xFF011F54), // #011F54
                              ),
                              children: const [
                                TextSpan(
                                  text:
                                      "Nowlii is like a car, it is your tool that will bring you where you are headed to! ",
                                ),
                                TextSpan(
                                  text: "✨",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      " like a domino effect in your life actions.",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Our biggest goal is for you to stop using Nowlii after 12 months.",
                    style: AppsTextStyles.extraBold22,
                  ),
                  const SizedBox(height: 24),

                  // Spacer to push content up
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
              constraints: BoxConstraints(maxHeight: screenHeight * 0.5),
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF4542EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "SOME OF OUR TIPS AND TRICKS HOW TO USE NOWLII 📖",
                      style: AppsTextStyles.black24UppercaseSome,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: AppsTextStyles.regular18.copyWith(
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                "We recommend booking the call with Nowlii when you are setting an alarm at night, ",
                          ),
                          TextSpan(
                            text: "10 minutes after the alarm",
                            style: AppsTextStyles.semiBold18.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const TextSpan(
                            text:
                                " so Nowlii will be there to start the day with you ✨",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomNextButton(
                      isEnabled: true,
                      onTap: () {
                        context.push("/animation");
                      },
                      buttonText: "Next",
                      iconPath: Assets.svgIcons.startLetsGo.path,
                      textStyle: AppsTextStyles.letsStartNext,
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
