import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_dea/screen/home/home_screen.dart';
import 'package:mobile_app_dea/screen/progress/progress.dart';
import 'package:mobile_app_dea/screen/quests/quests_my_quests_today_emty_state.dart'
    show QuestHomePage;

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable only in development mode
      builder: (context) => MyApp(), // Wrap the app in DevicePreview
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Design size used for ScreenUtil
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery:
            true, // Ensure device preview works with media queries
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Progress(),
        // // home: HomeScreen(),
        // home: SignInScreen(),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Your project imports
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/screen/Onboarding/nowli_how_to_use.dart';
import 'package:mobile_app_dea/screen/Onboarding/onboarding_features/onbording_fetures.dart';
import 'package:mobile_app_dea/screen/Onboarding/onbording_flow_file/onboarding_flow.dart';
import 'package:mobile_app_dea/screen/auth/enter_new_password.dart';
import 'package:mobile_app_dea/screen/auth/resent_password_page.dart';
import 'package:mobile_app_dea/screen/auth/sign_in_screen.dart';
import 'package:mobile_app_dea/screen/auth/sign_up.dart';
import 'package:mobile_app_dea/screen/reday_to_start_screen_p4.dart';
import 'package:mobile_app_dea/screen/test_file/VoiceOnboardingScreen%20.dart';
import 'package:mobile_app_dea/screen/test_file/test_file.dart'
    show OnboardingScreen;
import 'package:mobile_app_dea/screen/welcome_activetion_flow/popup_speking.dart';
import 'package:mobile_app_dea/screen/welcome_activetion_flow/procrastination_screen.dart';
import 'package:mobile_app_dea/screen/welcome_come_screen_p3.dart';

void main() {
  runApp(const MyApp()); // DevicePreview removed
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Ensure responsiveness
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme:
                GoogleFonts.poppinsTextTheme(), // Optional: keeps your GoogleFonts styling
          ),
          home: ProcrastinationScreen(), // Your onboarding start page
        );
      },
    );
  }
}



*/

// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart' show kReleaseMode;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core%20/app_routes/app_pages.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode, // Enable only in development mode
//       builder: (context) => MyApp(), // Wrap the app in DevicePreview
//     ),
//   );
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
