// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/screen/Onboarding/onboarding_features/onboarding_screen.dart';
// import 'package:mobile_app_dea/screen/home/swaipe_to_talk/swaipe_to_talk_loding.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const MyApp(), // Wrap your app
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812), // Ensure responsiveness
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           // useInheritedMediaQuery: true,
//           locale: DevicePreview.locale(context),
//           builder: DevicePreview.appBuilder,
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             textTheme:
//                 GoogleFonts.poppinsTextTheme(), // Optional: keeps your GoogleFonts styling
//           ),
//           home: const OnboardingScreen(),
//         );
//       },
//     );
//   }
// }

// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core%20/app_routes/app_pages.dart';

// // void main() {
// //   runApp(
// //     DevicePreview(
// //       enabled: !kReleaseMode, // Enable only in development mode
// //       builder: (context) => MyApp(), // Wrap the app in DevicePreview
// //     ),
// //   );
// // }
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       designSize: const Size(375, 812),
//       builder: (context, child) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             textTheme: GoogleFonts.poppinsTextTheme(),
//           ),

//           routerConfig: AppPages.router,
//         );
//       },
//     );
//   }
// }

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode, // Enable only in development mode
//       builder: (context) => MyApp(), // Wrap the app in DevicePreview
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          routerConfig: AppPages.router,
        );
      },
    );
  }
}
