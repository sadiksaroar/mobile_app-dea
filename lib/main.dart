import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/je_je_page_gula_connect_kori_nai.dart/ai_calling.dart';
import 'package:mobile_app_dea/je_je_page_gula_connect_kori_nai.dart/quest_for_done_screen.dart';
import 'package:mobile_app_dea/je_je_page_gula_connect_kori_nai.dart/steak_popup.dart';
import 'package:mobile_app_dea/screen/Onboarding/onboarding_features/onbording_fetures.dart';
import 'package:mobile_app_dea/screen/Onboarding/pop_spking_loding.dart';
import 'package:mobile_app_dea/je_je_page_gula_connect_kori_nai.dart/popup_multi_misscal_talk.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Ensure responsiveness
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme:
                GoogleFonts.poppinsTextTheme(), // Optional: keeps your GoogleFonts styling
          ),
          home: const QuestForDoneScreen(),
        );
      },
    );
  }
}

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

// // import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core%20/app_routes/app_pages.dart';

// void main() {
//   runApp(const MyApp());
// }

// // void main() {
// //   runApp(
// //     DevicePreview(
// //       enabled: !kReleaseMode, // Enable only in development mode
// //       builder: (context) => MyApp(), // Wrap the app in DevicePreview
// //     ),
// //   );
// // }

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

// class ServiceBoxTimerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFD6E4FF),
//               Color(0xFFF0F4FF),
//             ], // Light blue gradient
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               SizedBox(height: 40),
//               // Header Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Answer emails',
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF0D1B3E),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Icon(Icons.email_outlined, size: 30, color: Colors.grey),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "You're doing great – keep it going",
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),

//               Spacer(),

//               // Circular Progress & Character Section
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Outer soft glow/shadow
//                   Container(
//                     width: 250,
//                     height: 250,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0xFFC5D5F9).withOpacity(0.5),
//                     ),
//                   ),
//                   // Inner Purple Circle
//                   Container(
//                     width: 300,
//                     height: 300,
//                     decoration: BoxDecoration(
//                       gradient: RadialGradient(
//                         center: Alignment(-0.0814, 0.004),
//                         radius: 0.9745,
//                         colors: [
//                           Color.fromRGBO(63, 60, 214, 0.0),
//                           Color.fromRGBO(63, 60, 214, 0.4),
//                         ],
//                         stops: [0.0, 0.6683],
//                       ),
//                     ),
//                   ),
//                   // Progress Border (Blue arc)
//                   SizedBox(
//                     width: 210,
//                     height: 210,
//                     child: CircularProgressIndicator(
//                       value: 0.25, // 1:21/10:00 calculation
//                       strokeWidth: 12,
//                       strokeCap: StrokeCap.round,
//                       backgroundColor: Colors.transparent,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         Color(0xFF3B82F6),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Spacer(),

//               // Timer Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.pause_circle_filled,
//                     size: 40,
//                     color: Color(0xFF4A3AFF),
//                   ),
//                   SizedBox(width: 10),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '01:21 ',
//                           style: TextStyle(
//                             fontSize: 48,
//                             fontWeight: FontWeight.w900,
//                             color: Color(0xFF4A3AFF),
//                           ),
//                         ),
//                         TextSpan(
//                           text: '/ 10:00',
//                           style: TextStyle(
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFA5B4FC),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 40),

//               // Bottom Action Buttons
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 30,
//                   vertical: 20,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildIconButton(Icons.mic_off, Colors.black12),
//                     _buildIconButton(
//                       Icons.volume_up,
//                       Colors.blueAccent.withOpacity(0.2),
//                     ),
//                     Column(
//                       children: [
//                         _buildIconButton(
//                           Icons.check,
//                           Color(0xFFC5D5F9),
//                           size: 70,
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           'Mark as done',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildIconButton(IconData icon, Color color, {double size = 60}) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       child: Icon(icon, color: Colors.black87),
//     );
//   }
// }
