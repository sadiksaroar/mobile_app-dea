import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/view/auth/sign_up.dart';
import 'package:mobile_app_dea/view/entry_screen_p1.dart';
import 'package:mobile_app_dea/view/reday_to_start_screen_p4.dart';
import 'package:mobile_app_dea/view/welcome_come_screen_p3.dart';

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
        home: SignupPage(), // Your EntryScreen widget
        builder: DevicePreview
            .appBuilder, // Use DevicePreview for all screens in development
      ),
    );
  }
}
