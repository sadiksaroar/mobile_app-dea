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
      color: Color(0xFF011F54), // Default color (can override)
    ),
  );

  static TextStyle signInText = GoogleFonts.alfaSlabOne(
    fontWeight: FontWeight.w400, // Regular (400)
    fontStyle: FontStyle.normal,
    fontSize: 40.sp, // 50px responsive

    textStyle: const TextStyle(
      color: Color(0xFF011F54), // Default color (can override)
    ),
  );

  static TextStyle fullNameAndEmail = GoogleFonts.workSans(
    fontWeight: FontWeight.w600, // SemiBold
    fontStyle: FontStyle.normal, // Normal
    fontSize: 20, // 16px
    height: 1.0, // Line-height 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF4542EB), // Hex color #4542EB
  );
  static TextStyle regular16 = GoogleFonts.workSans(
    fontWeight: FontWeight.w400, // Regular
    fontStyle: FontStyle.normal, // Normal (not italic)
    fontSize: 16, // 16px
    height: 1.4, // Line-height 140%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF011F54), // Hex color #011F54
  );
  static TextStyle continueButton = GoogleFonts.workSans(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 0.8, // Line-height 80%
    letterSpacing: 0, // 0px
  );
  static TextStyle signInContinueButton = GoogleFonts.workSans(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 0.8, // Line-height 80%
    letterSpacing: 0, // 0px
    color: Color(0xFF8C4F15),
  );
  static TextStyle googleContinueButton = GoogleFonts.workSans(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 0.8, // Line-height 80%
    letterSpacing: 0, // 0px
    color: const Color(0xFF4542EB), // Hex color #4542EB
  );
  static final TextStyle workSansSemiBold16 = GoogleFonts.workSans(
    fontWeight: FontWeight.w700, // SemiBold
    fontStyle: FontStyle.normal, // Regular style
    fontSize: 16, // 16px
    height: 1.0, // line-height: 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF011F54), // #011F54
  );
  static final TextStyle workSansSemiBold16SignInalredy = GoogleFonts.workSans(
    fontWeight: FontWeight.w700, // SemiBold
    fontStyle: FontStyle.normal, // Regular style
    fontSize: 16, // 16px
    height: 1.0, // line-height: 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF4542EB), // #4542EB
  );
  static final TextStyle workSansSemiBold16signIn = GoogleFonts.workSans(
    fontWeight: FontWeight.w700, // SemiBold
    fontStyle: FontStyle.normal, // Regular style
    fontSize: 16, // 16px
    height: 1.0, // line-height: 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF011F54), // #011F54
  );
  static final TextStyle workSansSemiBold16SignInAlread = GoogleFonts.workSans(
    fontWeight: FontWeight.w700, // SemiBold
    fontStyle: FontStyle.normal, // Regular style
    fontSize: 16, // 16px
    height: 1.0, // line-height: 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFFFF8F26), // #4542EB
  );
  static TextStyle fullNameAndEmailSignIn = GoogleFonts.workSans(
    fontWeight: FontWeight.w600, // SemiBold
    fontStyle: FontStyle.normal, // Normal
    fontSize: 20, // 16px
    height: 1.0, // Line-height 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF4542EB), // Hex color #4542EB
  );
  static TextStyle resetPassword = GoogleFonts.alfaSlabOne(
    fontWeight: FontWeight.w400, // Regular (400)
    fontStyle: FontStyle.normal,
    fontSize: 35.sp, // 50px responsive
    textStyle: const TextStyle(
      color: Color(0xFF011F54), // Default color (can override)
    ),
  );
  static TextStyle sendResetLinkButton = GoogleFonts.workSans(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    height: 0.8, // Line-height 80%
    letterSpacing: 0, // 0px
    color: Color(0xFF011F54),
  );
  static final TextStyle didNotGetEmail = GoogleFonts.workSans(
    fontWeight: FontWeight.w500, // SemiBold
    fontStyle: FontStyle.normal, // Regular style
    fontSize: 16, // 16px
    height: 1.0, // line-height: 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFF011F54), // #011F54
  );
  static final TextStyle resendLink = GoogleFonts.workSans(
    fontWeight: FontWeight.w500, // SemiBold
    fontStyle: FontStyle.normal, // Regular style
    fontSize: 16, // 16px
    height: 1.0, // line-height: 100%
    letterSpacing: -0.5, // -0.5px
    color: const Color(0xFFFF8F26), // #4542EB
  );
  static final TextStyle PasswordUpdate = GoogleFonts.workSans(
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 20,
    height: 1.2, // 120%
    letterSpacing: -0.02 * 20, // -2%
    color: const Color(0xFF011F54),
  );
  static final TextStyle PasswordUpdateSub = GoogleFonts.workSans(
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16,
    height: 1.32, // 132%
    letterSpacing: -0.05 * 16, // -5%
    color: const Color(0xFF4C586E),
  );
}
