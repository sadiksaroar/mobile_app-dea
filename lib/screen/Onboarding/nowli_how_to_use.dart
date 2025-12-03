import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class NowliHowToUse extends StatelessWidget {
  const NowliHowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push("/onbordingFetures");
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFFF1E8),
                          child: Assets.svgIcons.backIconPng.image(
                            height: 24,
                            width: 24,
                          ),
                        ),
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
                      GestureDetector(
                        onTap: () {
                          context.push("/animation"); // Skip action
                        },
                        child: Text(
                          "Skip",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Card with icon and text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA0E871),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Assets.svgIcons.nowliHowToUse.svg(
                            height: 80,
                            width: 80,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: AppsTextStyles.extraBold16,
                              children: const [
                                TextSpan(
                                  text:
                                      "Nowlii is like a car, it is your toll that will bring where you are headed to! ",
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
                  const SizedBox(height: 24),
                  Text(
                    "Our biggest goal is you to stop to use Nowlii after 12 months.",
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
              constraints: BoxConstraints(
                // Ensures container doesn't exceed 60% of screen height
                maxHeight: screenHeight * 0.6,
              ),
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
                                "We recommend booking the call with Nowlii when you are putting an alarm at night, ",
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
                          context.push("/animation");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Next", style: AppsTextStyles.letsStartNext),
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
          ),
        ],
      ),
    );
  }
}
