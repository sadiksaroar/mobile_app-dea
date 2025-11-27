import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {
            // Navigator.pop(context);
            context.pop("/nowliHowToUse");
          },
        ),
        title: Row(
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
            const SizedBox(width: 10),
            const Text(
              "Skip",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "LET'S SHAPE YOUR NOWLII",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D1C2E),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Give it a form so we can face it, instead of chase it!",
              style: TextStyle(fontSize: 14, color: Colors.black54),
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
            // Next button
            GestureDetector(
              onTap: () {
                context.push("/onboardingScreen");
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA34E),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
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
