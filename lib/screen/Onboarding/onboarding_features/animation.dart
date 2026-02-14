import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class Animation extends StatefulWidget {
  const Animation({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () {
                      context.push("/onbordingFetures");
                    },
                    child: SizedBox(
                      height: 56,
                      width: 56,
                      child: CircleAvatar(
                        child: Assets.svgIcons.backIconSvg.svg(
                          height: 56,
                          width: 56,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20),

                  // Progress bar
                  Expanded(
                    child: Container(
                      height: 10,
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

                  SizedBox(width: 15),

                  // Progress text
                  Text(
                    '5/6',
                    style: TextStyle(
                      color: const Color(0xFF4C586E),
                      fontSize: 12,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),

                  // SizedBox(width: 5),

                  // Skip button - Fixed navigation
                  GestureDetector(
                    onTap: () {
                      context.push("/onboardingScreen"); // Skip to next screen
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
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
            SizedBox(height: 20),
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
              color: Colors.black.withValues(alpha: 0.1),
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
}
