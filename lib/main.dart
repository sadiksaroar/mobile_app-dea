import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/screen/Onboarding/onbording_flow_file/onboarding_flow.dart';
import 'package:mobile_app_dea/screen/auth/enter_new_password.dart';
import 'package:mobile_app_dea/screen/auth/resent_password_page.dart';
import 'package:mobile_app_dea/screen/auth/sign_in_screen.dart';
import 'package:mobile_app_dea/screen/auth/sign_up.dart';
import 'package:mobile_app_dea/screen/entry_screen_p1.dart';
import 'package:mobile_app_dea/screen/reday_to_start_screen_p4.dart';
import 'package:mobile_app_dea/screen/welcome_come_screen_p3.dart';

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
        home: OnboardingFlow(), // Your EntryScreen widget
        builder: DevicePreview
            .appBuilder, // Use DevicePreview for all screens in development
      ),
    );
  }
}
