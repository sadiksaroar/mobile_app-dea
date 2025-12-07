// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';

// class EntryScreen extends StatelessWidget {
//   const EntryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /// Background SVG Image
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             bottom: 220.h,
//             child: Assets.svgImages.entryScreenTwo.svg(
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),

//           /// Bottom Rounded Container
//           Positioned(
//             top: 270.h,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFF4542EB),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// Heading
//                       Text(
//                         "LET’S GET\nTHINGS DONE.",
//                         // style: GoogleFonts.alfaSlabOne(
//                         //   color: Colors.white,
//                         //   fontSize: 28.sp,
//                         //   height: 1.2,
//                         // ),
//                         style: AppsTextStyles.alfaSlabTitleEntryScreen,
//                       ),
//                       SizedBox(height: 10.h),

//                       /// Subtitle
//                       Text(
//                         "Your daily push to start - with real voice support.",
//                         style: AppsTextStyles.workSansBodyEntryScreen,
//                       ),
//                       SizedBox(height: 40.h),

//                       /// Get Started Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 55.h,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFFF8A00),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Get Started",
//                             style: AppsTextStyles.getStarted,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.h),

//                       /// Have an Account Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 55.h,
//                         child: OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(
//                               color: Colors.white,
//                               width: 2,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Have an account?",
//                             style: AppsTextStyles.haveAnAccount,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           /// Logo on Top Center
//           Positioned(
//             top: 20.h,
//             left: 0,
//             right: 0,
//             child: Center(
//               // Use generated svg accessor instead of raster asset
//               child: Assets.svgIcons.nowlnLogo.svg(
//                 width: 140.w,
//                 height: 80.h,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';

// class EntryScreen extends StatelessWidget {
//   const EntryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background SVG Image
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             bottom: 240.h,
//             child: Image.asset(
//               'assets/svg_images/enttry_two_screnn.png', // replace with your asset
//               fit: BoxFit.cover,
//             ),
//           ),

//           /// Bottom Rounded Container
//           Positioned(
//             top: 380,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFF4542EB),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// Heading
//                       Text(
//                         "LET’S GET THINGS DONE.",
//                         style: AppsTextStyles.alfaSlabTitleEntryScreen,
//                       ),
//                       SizedBox(height: 10.h),

//                       /// Subtitle
//                       Text(
//                         "Your daily push to start - with real voice support.",
//                         style: AppsTextStyles.workSansBodyEntryScreen,
//                       ),
//                       SizedBox(height: 40.h),

//                       /// Get Started Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 80,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFFF8A00),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                           onPressed: () {
//                             context.push("/welcomeScreen");
//                           },
//                           child: Text(
//                             "Get Started",
//                             style: AppsTextStyles.getStarted,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.h),

//                       /// Have an Account Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 80,
//                         child: OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(
//                               color: Colors.white,
//                               width: 2,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                           onPressed: () {
//                             context.push("/signInScreen");
//                           },
//                           child: Text(
//                             "Have an account?",
//                             style: AppsTextStyles.haveAnAccount,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           /// Logo on Top Center
//           Positioned(
//             top: 55,
//             left: 0,
//             right: 0,
//             child: Center(
//               // Use generated svg accessor instead of raster asset
//               child: Assets.svgIcons.nowlnLogo.svg(
//                 width: 140.w,
//                 height: 80.h,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8DCAE0), // Light Blue (from image)
              Color(0xFF478BB3), // Darker Blue (from image)
            ],
          ),
        ),
        child: Stack(
          children: [
            // Main Image with overlay logo
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Stack(
                children: [
                  // Main person image
                  Positioned.fill(
                    child: Image.asset(
                      Assets.svgImages.enttryTwoScrenn.path,
                      height: 375,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      // color: Colors,
                    ),
                  ),
                  // Logo overlay on top of image
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Assets.svgIcons.nowlnLogo.svg(
                          width: 140,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom rounded container with content
            Positioned(
              top: MediaQuery.of(context).size.height * 0.50,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 30.0,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Heading
                        Text(
                          "LET'S GET THINGS DONE.",
                          style: AppsTextStyles.alfaSlabTitleEntryScreen,
                        ),
                        const SizedBox(height: 10.0),

                        /// Subtitle
                        Text(
                          "Your daily push to start - with real voice support.",
                          style: AppsTextStyles.workSansBodyEntryScreen,
                        ),
                        const SizedBox(height: 40.0),

                        /// Get Started Button
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF8A00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              context.push("/welcomeScreen");
                            },
                            child: Text(
                              "Get Started",
                              style: AppsTextStyles.getStarted,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        /// Have an Account Button
                        SizedBox(
                          width: double.infinity,
                          height: 80,
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
                            onPressed: () {
                              context.push("/signInScreen");
                            },
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
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Assets.svgImages.deaMagi.path,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.50,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 30.0,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Heading
                      Text(
                        "LET'S GET THINGS DONE.",
                        style: AppsTextStyles.alfaSlabTitleEntryScreen,
                      ),
                      const SizedBox(height: 10.0),

                      /// Subtitle
                      Text(
                        "Your daily push to start - with real voice support.",
                        style: AppsTextStyles.workSansBodyEntryScreen,
                      ),
                      const SizedBox(height: 40.0),

                      /// Get Started Button
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            context.push("/welcomeScreen");
                          },
                          child: Text(
                            "Get Started",
                            style: AppsTextStyles.getStarted,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      /// Have an Account Button
                      SizedBox(
                        width: double.infinity,
                        height: 80,
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
                          onPressed: () {
                            context.push("/signInScreen");
                          },
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
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Zoom Feature
          Positioned.fill(
            child: InteractiveViewer(
              minScale: 0.50,
              maxScale: 0.50,
              boundaryMargin: const EdgeInsets.all(0),
              panEnabled: false,
              scaleEnabled: false,
              child: Image.asset(
                Assets.svgImages.deaMagi.path,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo overlay on top
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Assets.svgIcons.nowlnLogo.svg(
                  width: 140,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Bottom rounded container with content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.50,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 30.0,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Heading
                      Text(
                        "LET'S GET THINGS DONE.",
                        style: AppsTextStyles.alfaSlabTitleEntryScreen,
                      ),
                      const SizedBox(height: 10.0),

                      /// Subtitle
                      Text(
                        "Your daily push to start - with real voice support.",
                        style: AppsTextStyles.workSansBodyEntryScreen,
                      ),
                      const SizedBox(height: 40.0),

                      /// Get Started Button
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            context.push("/welcomeScreen");
                          },
                          child: Text(
                            "Get Started",
                            style: AppsTextStyles.getStarted,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      /// Have an Account Button
                      SizedBox(
                        width: double.infinity,
                        height: 80,
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
                          onPressed: () {
                            context.push("/signInScreen");
                          },
                          child: Text(
                            'Have an account?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.workSans(
                              color: const Color(0xFFFFFDF7), // Text-text-light
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              height: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
