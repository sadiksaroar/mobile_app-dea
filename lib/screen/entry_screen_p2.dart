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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
                        "LET’S GET THINGS DONE.",
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
                          onPressed: () {
                            context.push("/welcomeScreen");
                          },
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
