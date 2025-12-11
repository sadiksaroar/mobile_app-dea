import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.8,
      upperBound: 1.2,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);

    Future.delayed(Duration(seconds: 15), () {
      // Navigate to the next screen after the splash duration
      if (mounted) {
        context.go('/entryScreen');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4542EB),
      body: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(scale: _scaleAnimation.value, child: child);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50), // Rounded border radius
            child: SvgPicture.asset(
              'assets/svg_images/App Icon.svg', // Your SVG image
              width: 154, // Adjust the width as needed
              height: 154, // Adjust the height as needed
            ),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAnimation extends StatelessWidget {
  const MyAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie_animations/A fitness cow.json', // ✅ তোমার ফাইলের path
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShapeYourNowliiScreen extends StatelessWidget {
  const ShapeYourNowliiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EE), // light cream background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {},
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
              "LET’S SHAPE YOUR NOWLII",
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
                    color: Colors.blue.shade50,
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Food loading.json',
                    color: const Color(0xFFFFA34E),
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Sandy Loading.json',
                    color: Colors.green.shade100,
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Watermelon Fixing.json',
                    color: Colors.blue.shade100,
                  ),
                  buildLottieBox(
                    'assets/lottie_animations/Sandy Loading.json',
                    color: const Color(0xFF6654F1),
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
              onTap: () {},
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
        child: Lottie.asset(path, width: 100, height: 100, fit: BoxFit.contain),
      ),
    );
  }
}
*/

// ...existing code...

/*

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background SVG Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 220.h,
            child: Assets.svgImages.entryScreenTwo.svg(
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          /// Bottom Rounded Container
          Positioned(
            top: 270.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF4542EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Heading
                      Text(
                        "LET’S GET\nTHINGS DONE.",
                        // style: GoogleFonts.alfaSlabOne(
                        //   color: Colors.white,
                        //   fontSize: 28.sp,
                        //   height: 1.2,
                        // ),
                        style: AppsTextStyles.alfaSlabTitleEntryScreen,
                      ),
                      SizedBox(height: 10.h),

                      /// Subtitle
                      Text(
                        "Your daily push to start - with real voice support.",
                        style: AppsTextStyles.workSansBodyEntryScreen,
                      ),
                      SizedBox(height: 40.h),

                      /// Get Started Button
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Get Started",
                            style: AppsTextStyles.getStarted,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      /// Have an Account Button
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Have an account?",
                            style: AppsTextStyles.haveAnAccount,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// Logo on Top Center
          Positioned(
            top: 20.h,
            left: 0,
            right: 0,
            child: Center(
              // Use generated svg accessor instead of raster asset
              child: Assets.svgIcons.nowlnLogo.svg(
                width: 140.w,
                height: 80.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background SVG Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 240.h,
            child: Image.asset(
              'assets/svg_images/enttry_two_screnn.png', // replace with your asset
              fit: BoxFit.cover,
            ),
          ),

          /// Bottom Rounded Container
          Positioned(
            top: 270.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF4542EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Heading
                      Text(
                        "LET’S GET\nTHINGS DONE.",
                        style: AppsTextStyles.alfaSlabTitleEntryScreen,
                      ),
                      SizedBox(height: 10.h),

                      /// Subtitle
                      Text(
                        "Your daily push to start - with real voice support.",
                        style: AppsTextStyles.workSansBodyEntryScreen,
                      ),
                      SizedBox(height: 40.h),

                      /// Get Started Button
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Get Started",
                            style: AppsTextStyles.getStarted,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      /// Have an Account Button
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Have an account?",
                            style: AppsTextStyles.haveAnAccount,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// Logo on Top Center
          Positioned(
            top: 30.h,
            left: 0,
            right: 0,
            child: Center(
              // Use generated svg accessor instead of raster asset
              child: Assets.svgIcons.nowlnLogo.svg(
                width: 140.w,
                height: 80.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
