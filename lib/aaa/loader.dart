import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Color(0xFF011F54),
                  size: 24,
                ),
              ),
              SizedBox(height: 32.h),

              // Title
              Text(
                "Noted! Thanks for your honesty!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF011F54),
                  fontSize: 20.sp,
                  fontFamily: 'Wosker',
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 16.h),

              // Subtitle
              Text(
                "Fuzzy's here to make today \n a little easier.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
