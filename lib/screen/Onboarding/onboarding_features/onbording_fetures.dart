import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

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
                  GestureDetector(
                    onTap: () {
                      context.push("/onboardingFlow");
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
              // SizedBox(
              //   width: double.infinity,
              //   height: 104,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.orange[400],
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(50),
              //       ),
              //     ),
              //     onPressed: () {
              //       context.push("/nowliHowToUse");
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           "Let's start",
              //           style:
              //               AppsTextStyles.letsStartNext ??
              //               const TextStyle(
              //                 fontSize: 18,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //         ),
              //         const SizedBox(width: 30),
              //         SvgPicture.asset(
              //           Assets.svgIcons.startLetsGo.path,
              //           width: 60,
              //           height: 60,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              CustomNextButton(
                isEnabled: true,
                onTap: () {
                  context.push("/nowliHowToUse");
                },
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

  Widget buildCard({
    required Color color,
    required String svgPath,
    required String title,
    required String description,
  }) {
    return Container(
      // height: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgPath, width: 97, height: 97),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppsTextStyles.regular32Uppercase),
                const SizedBox(height: 4),
                Text(description, style: AppsTextStyles.regular16l),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
