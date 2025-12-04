// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_app_dea/screen/welcome_activetion_flow/popup_speking.dart';
// import 'package:mobile_app_dea/screen/welcome_activetion_flow/subscription_popup%20.dart';

// void main() {
//   runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       builder: (context, child) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         useInheritedMediaQuery: true,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),

//         // 🔥 FIXED HERE — choose any enum value
//         home: SubscriptionPage(),

//         builder: DevicePreview.appBuilder,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/screen/progress/progress.dart';

// void main() {
//   runApp(const MyApp()); // DevicePreview removed
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812), // Ensure responsiveness
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             textTheme:
//                 GoogleFonts.poppinsTextTheme(), // Optional: keeps your GoogleFonts styling
//           ),
//           home: Progress(), // Your onboarding start page
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
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable only in development mode
      builder: (context) => MyApp(), // Wrap the app in DevicePreview
    ),
  );
}
// void main() {
//   runApp(MyApp());
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
