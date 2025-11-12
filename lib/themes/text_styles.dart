import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppsTextStyles {
  static TextStyle alfaSlabTitleEntryScreen = GoogleFonts.alfaSlabOne(
    color: Colors.white,
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static TextStyle workSansBodyEntryScreen = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 15.sp,
    height: 1.4,
    color: Colors.white,
  );

  static TextStyle getStarted = GoogleFonts.alfaSlabOne(
    fontSize: 18.sp,
    color: const Color(0xFF011F54),
  );
  static TextStyle haveAnAccount = GoogleFonts.alfaSlabOne(
    fontSize: 16.sp,
    color: const Color(0xFFFFFEF8),
  );
  static TextStyle appleAndGoogleText = GoogleFonts.alfaSlabOne(
    fontSize: 12.sp,
    color: const Color(0xFFFFFEF8),
  );
  static TextStyle readyToStart = GoogleFonts.alfaSlabOne(
    // fontSize: 10,
    fontSize: 14.sp,
    color: const Color(0xFFFFFEF8),
  );

  static final TextStyle normalText = TextStyle(
    fontSize: 14.sp,
    color: Colors.black87,
    height: 1.4,
  );

  static final TextStyle linkText = TextStyle(
    color: Color(0xFF4542EB),
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500,
  );
  static TextStyle signupText = GoogleFonts.alfaSlabOne(
    fontWeight: FontWeight.w400, // Regular (400)
    fontStyle: FontStyle.normal,
    fontSize: 40.sp, // 50px responsive

    textStyle: const TextStyle(
      color: Color(0xFF001858), // Default color (can override)
    ),
  );
}
