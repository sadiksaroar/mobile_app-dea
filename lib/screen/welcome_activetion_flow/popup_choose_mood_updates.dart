import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class PopupChooseMoodUpdates extends StatelessWidget {
  const PopupChooseMoodUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // 🔥 Background Fix – use .path directly
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.svgImages.popupChooseMoodUpdates.path),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // 🔴 TOP LEFT CLOSE BUTTON
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      Assets.svgIcons.popupSpwakingCross.path,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 80),

                // 🟢 CENTER IMAGE — FIXED
                Image.asset(
                  "assets/svg_images/Popup_Choose mood updates.png",
                  height: 215,
                  width: 230,
                ),

                const SizedBox(height: 20),

                // TEXT
                const Text(
                  "Want to keep track of how you feel?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Fuzzy can gently check in each day — to help you spot your emotional patterns and celebrate progress. 🌿",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                // 🔵 FIRST BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 74,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFEF8),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF4A46FF)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),

                    label: Text(
                      'Update Mood',
                      style: AppsTextStyles.haveAnAccount,
                      selectionColor: Color(0xFF4A46FF),
                    ),
                    onPressed: () {
                      context.push("");
                    },
                  ),
                ),
                const SizedBox(height: 15),

                // 🟣 SECOND BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 74,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A46FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),

                    label: Text('Skip', style: AppsTextStyles.haveAnAccount),
                    onPressed: () {
                      context.push("");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
