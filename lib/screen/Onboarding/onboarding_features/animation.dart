import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class Animation extends StatelessWidget {
  const Animation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF1), // light cream background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.svgIcons.backIconSvg.path,
            height: 54,
            width: 54,
          ),
          onPressed: () {
            // Navigator.pop(context);
            context.pop("/nowliHowToUse");
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    value: 5 / 6,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFF4B9EFF),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 0),
              Text("Skip", style: AppsTextStyles.letsStartNext),
            ],
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "LET'S SHAPE YOUR NOWLII",
              style: AppsTextStyles.black24Uppercase,
            ),
            const SizedBox(height: 6),
            Text(
              "Give it a form so we can face it, instead of chase it!",
              style: AppsTextStyles.PasswordUpdateSub,
            ),
            const SizedBox(height: 20),
            // 6 Lottie items (Grid layout)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  buildLottieBox(
                    'assets/lottie_animations/A fitness cow.json',
                    isSelected: true,
                    color: const Color(0xFF011F54),
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Dancing llama.json',
                    color: const Color(0xFFFF8F26),
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Easter Bunny Boy waving.json',
                    color: const Color(0xFFFAE3CE),
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Food loading.json',
                    color: const Color(0xFFDFEFFF),
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Sandy Loading.json',
                    color: const Color(0xFF4542EB),
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Watermelon Fixing.json',
                    color: const Color(0xFF89D6C0),
                  ),
                ],
              ),
            ),

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
            //       context.push("/onboardingScreen");
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Center(
            //           child: Text("Next", style: AppsTextStyles.letsStartNext),
            //         ),
            //         const SizedBox(width: 60),
            //         SvgPicture.asset(
            //           Assets.svgIcons.startLetsGo.path,
            //           width: 90,
            //           height: 90,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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

  Widget buildLottieBox(String path, {bool isSelected = false, Color? color}) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(color: Colors.blueAccent, width: 3)
            : null,
      ),
      child: Center(
        child: Lottie.asset(path, width: 110, height: 110, fit: BoxFit.contain),
      ),
    );
  }
}
