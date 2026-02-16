// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/aaa/ai_voice_call/ai_test_call.dart';
// import 'package:mobile_app_dea/aaa/ai_voice_call/ai_voice_call.dart';
// import 'package:mobile_app_dea/aaa/great_job.dart';
// import 'package:mobile_app_dea/screen/Onboarding/pop_spking_loding.dart';
// import 'package:mobile_app_dea/screen/auth/sign_in_screen.dart';
// import 'package:mobile_app_dea/screen/home/home_screen.dart';
// import 'package:mobile_app_dea/screen/profile/Edit_profile/edit_from.dart';
// import 'package:mobile_app_dea/screen/profile/Edit_profile/edit_profile.dart';
// import 'package:mobile_app_dea/screen/welcome_activetion_flow/notice_loader_screen.dart';
// import 'package:mobile_app_dea/screen/welcome_activetion_flow/popup_choose_mood_updates.dart';

// // void main() {
// //   runApp(
// //     DevicePreview(
// //       enabled: true,
// //       builder: (context) => const MyApp(), // Wrap your app
// //     ),
// //   );
// // }
// void main() {
//   runApp(const MyApp());
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
//           home: const HomeScreen(),
//         );
//       },
//     );
//   }
// }
// class EditProfileScreen extends StatefulWidget {

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
//   runApp(const MyApp());
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
