import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class NowliHowToUse extends StatelessWidget {
  const NowliHowToUse({super.key});

  @override
  Widget build(BuildContext context) {
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
                  // Card with icon and text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFA0E871),
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
                            height: 40,
                            width: 40,
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
                  // Spacer so the Stack positioned container can overlay
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
          // Positioned bottom container
          Positioned(
            top: 403, // adjust as needed
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF4542EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "SOME OF OUR TIPS AND TRICKS HOW TO USE NOWLII 📖",
                    style: AppsTextStyles.black24UppercaseSome,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      style: AppsTextStyles.regular18,
                      children: [
                        const TextSpan(
                          text:
                              "We recommend booking the call with Nowlii when you are putting an alarm at night, ",
                        ),
                        TextSpan(
                          text: "10 minutes after the alarm",
                          style:
                              AppsTextStyles.semiBold18, // << Your custom style
                        ),
                        const TextSpan(
                          text:
                              " so Nowlii will be there to start the day with you ✨",
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.orange,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(16),
                  //     ),
                  //     minimumSize: const Size(double.infinity, 56),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: const [
                  //       Text(
                  //         "Next",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       SizedBox(width: 8),
                  //       Icon(Icons.arrow_forward),
                  //     ],
                  //   ),
                  // ),
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
                            "Next",
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
        ],
      ),
    );
  }
}
