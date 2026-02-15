import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
import 'package:mobile_app_dea/screen/auth/sign_in_controller.dart';
import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    InputDecoration fieldDecoration({
      required String label,
      required String hint,
      Widget? suffixIcon,
      required TextStyle labelStyle,
    }) {
      const borderSide = BorderSide(color: Color(0xFFC3DBFF), width: 1);
      final borderRadius = BorderRadius.circular(16);

      final fixedBorder = OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
        gapPadding: 8,
      );

      return InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: labelStyle,
        labelStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        enabledBorder: fixedBorder,
        focusedBorder: fixedBorder,
        errorBorder: fixedBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: fixedBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        suffixIcon: suffixIcon,
      );
    }

    Widget socialButton({required String icon, required String text}) {
      return SizedBox(
        width: double.infinity,
        height: 64,
        child: OutlinedButton.icon(
          icon: SvgPicture.asset(icon, height: 20, width: 20),
          label: Text(text, style: AppsTextStyles.workSansSemiBold16signIn),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF011F54), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Icons Row
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Assets.svgIcons.backIconSvg.svg(
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Assets.svgIcons.signInPageIcon.svg(height: 80, width: 80),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: const Color(0xFF011F54) /* Background-bg-dark */,
                    fontSize: 86.sp,
                    fontFamily: 'Wosker',
                    fontWeight: FontWeight.w400,
                    height: 0.80,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text("SIGN IN", style: AppsTextStyles.signupText),
              // ),
              // const SizedBox(height: 10),

              // 📧 Email Field
              Obx(() {
                // Read .obs value unconditionally so GetX always detects a subscription
                final isValid = controller.isEmailValid.value;
                return SizedBox(
                  height: 59,
                  child: TextFormField(
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(
                      context,
                    ).requestFocus(controller.passwordFocus),
                    decoration: fieldDecoration(
                      label: "Email address",
                      hint: "",
                      labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                      suffixIcon: controller.emailController.text.isEmpty
                          ? null
                          : Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IconButton(
                                icon: Icon(
                                  isValid
                                      ? Icons.check_circle
                                      : Icons.warning_amber_rounded,
                                  size: 20,
                                  color: isValid ? Colors.green : Colors.red,
                                ),
                                onPressed: () =>
                                    controller.emailController.clear(),
                              ),
                            ),
                    ),
                  ),
                );
              }),
              Obx(() {
                if (!controller.isEmailValid.value &&
                    controller.emailController.text.isNotEmpty) {
                  return Column(
                    children: [
                      const SizedBox(height: 6),
                      const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          "Please enter a valid email address.",
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 10),

              // 🔒 Password Field
              Obx(
                () => SizedBox(
                  height: 59,
                  child: TextFormField(
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocus,
                    obscureText: controller.obscurePassword.value,
                    textInputAction: TextInputAction.done,
                    decoration: fieldDecoration(
                      label: "Password",
                      hint: "*****",
                      labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.visible,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "It happens! ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: GestureDetector(
                                onTap: () {
                                  context.push("/resentPasswordPage");
                                },
                                child: const Text(
                                  "Reset it here.",
                                  style: TextStyle(
                                    color: Color(0xFF0A214D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Continue Button
              // Continue Button (Modified - Always enabled)
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    context.push("/onboardingFlow");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8F26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: AppsTextStyles.signInContinueButton,
                  ),
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 55,
              //   child: Obx(
              //     () => ElevatedButton(
              //       onPressed: controller.isButtonEnabled.value
              //           ? () {
              //               context.push("/onboardingFlow");
              //             }
              //           : null,
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: const Color(0xFFFF8F26),
              //         disabledBackgroundColor: const Color(0xFFFF8F26),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30),
              //         ),
              //       ),
              //       child: Text(
              //         "Continue",
              //         style: AppsTextStyles.signInContinueButton,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 15),

              // Divider with "or"
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 2, color: Colors.black26)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or", style: TextStyle(color: Colors.black54)),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.black26)),
                ],
              ),
              const SizedBox(height: 25),

              // Social Buttons
              socialButton(
                icon: Assets.svgIcons.signInGoole.path,
                text: "Continue with Google",
              ),
              const SizedBox(height: 15),
              socialButton(
                icon: Assets.svgIcons.appleIconSignIn.path,
                text: "Continue with Apple",
              ),

              const SizedBox(height: 90),

              // Sign In Text
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? → ",
                    style: AppsTextStyles.workSansSemiBold16,
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: AppsTextStyles.workSansSemiBold16SignInAlread,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push("/signUpScreen");
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFEFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: 1.sw,
            constraints: BoxConstraints(
              minHeight:
                  1.sh -
                  MediaQuery.of(context).viewPadding.top -
                  MediaQuery.of(context).viewPadding.bottom,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Main content section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Header section with logo and SIGN UP text
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo and title section
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Logo row
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 57.w,
                                    height: 55.h,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFC3DBFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          750.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Container(
                                    width: 18.w,
                                    height: 18.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                  ),
                                  SizedBox(width: 20.w),
                                  Container(
                                    width: 24.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              // SIGN UP title
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: const Color(0xFF011F54),
                                  fontSize: 52.sp,
                                  fontFamily: 'Wosker',
                                  fontWeight: FontWeight.w400,
                                  height: 0.80,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Input fields
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildInputField('Full name'),
                            SizedBox(height: 8.h),
                            _buildInputField('Email address'),
                            SizedBox(height: 8.h),
                            _buildPasswordField(),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Terms text
                        SizedBox(
                          width: double.infinity,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'By signing up, you agree to Nowlii\'s ',
                                  style: TextStyle(
                                    color: const Color(0xFF4C586E),
                                    fontSize: 14.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 1.60,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: const Color(0xFF4542EB),
                                    fontSize: 14.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    height: 1.60,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                                TextSpan(
                                  text: ' & ',
                                  style: TextStyle(
                                    color: const Color(0xFF4C586E),
                                    fontSize: 14.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 1.60,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: const Color(0xFF4542EB),
                                    fontSize: 14.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    height: 1.60,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                                TextSpan(
                                  text: '.',
                                  style: TextStyle(
                                    color: const Color(0xFF4542EB),
                                    fontSize: 14.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 1.60,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Continue button
                    _buildPrimaryButton('Continue'),
                    SizedBox(height: 20.h),

                    // Or divider
                    Row(
                      children: [
                        Text(
                          'or',
                          style: TextStyle(
                            color: const Color(0xFF4C586E),
                            fontSize: 12.sp,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Social login buttons
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSocialButton('Continue with Google'),
                        SizedBox(height: 8.h),
                        _buildSocialButton('Continue with Apple'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // Sign in link
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? → ',
                        style: TextStyle(
                          color: const Color(0xFF011F54),
                          fontSize: 16.sp,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.50,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: const Color(0xFF4542EB),
                          fontSize: 16.sp,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for input fields
  Widget _buildInputField(String placeholder) {
    return Container(
      width: double.infinity,
      height: 59.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFDF7),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0xFFC3DBFF)),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          placeholder,
          style: TextStyle(
            color: const Color(0xFF4C586E),
            fontSize: 16.sp,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w400,
            height: 1.40,
            letterSpacing: -0.50,
          ),
        ),
      ),
    );
  }

  // Helper method for password field
  Widget _buildPasswordField() {
    return Container(
      width: double.infinity,
      height: 59.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFDF7),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0xFFC3DBFF)),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Password',
            style: TextStyle(
              color: const Color(0xFF4C586E),
              fontSize: 16.sp,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
              height: 1.40,
              letterSpacing: -0.50,
            ),
          ),
          Icon(
            Icons.visibility_off_outlined,
            size: 18.w,
            color: const Color(0xFF4C586E),
          ),
        ],
      ),
    );
  }

  // Helper method for primary button
  Widget _buildPrimaryButton(String text) {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF4542EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999.r),
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFFFFDF7),
            fontSize: 20.sp,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w900,
            height: 0.80,
          ),
        ),
      ),
    );
  }

  // Helper method for social login buttons
  Widget _buildSocialButton(String text) {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.w, color: const Color(0xFF6A68EF)),
          borderRadius: BorderRadius.circular(999.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            text.contains('Google') ? Icons.g_mobiledata : Icons.apple,
            size: 20.w,
            color: const Color(0xFF4542EB),
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF4542EB),
              fontSize: 20.sp,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w900,
              height: 0.80,
            ),
          ),
        ],
      ),
    );
  }
}
/*
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
import 'package:mobile_app_dea/screen/auth/sign_in_controller.dart';
import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Responsive helper functions
    double responsiveWidth(double percentage) => width * percentage;
    double responsiveHeight(double percentage) => height * percentage;
    double responsiveFontSize(double baseSize) => baseSize * (width / 375);

    // Responsive padding
    final horizontalPadding = responsiveWidth(0.08); // 8% of screen width
    final verticalPadding = responsiveHeight(0.03); // 3% of screen height

    // Responsive icon size
    final iconSize = (width * 0.18).clamp(60.0, 90.0);

    // Responsive button height
    final buttonHeight = responsiveHeight(0.065).clamp(56.0, 70.0);

    // Responsive spacing
    final smallSpacing = responsiveHeight(0.01);
    final mediumSpacing = responsiveHeight(0.015);
    final largeSpacing = responsiveHeight(0.025);

    InputDecoration fieldDecoration({
      required String label,
      required String hint,
      Widget? suffixIcon,
      required TextStyle labelStyle,
    }) {
      const borderSide = BorderSide(color: Color(0xFFC3DBFF), width: 1);
      final borderRadius = BorderRadius.circular(16);

      final fixedBorder = OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
        gapPadding: 8,
      );

      return InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: labelStyle,
        labelStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          vertical: responsiveHeight(0.025).clamp(16.0, 24.0),
          horizontal: responsiveWidth(0.06).clamp(20.0, 28.0),
        ),
        enabledBorder: fixedBorder,
        focusedBorder: fixedBorder,
        errorBorder: fixedBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: fixedBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        suffixIcon: suffixIcon,
      );
    }

    Widget socialButton({required String icon, required String text}) {
      return SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: OutlinedButton.icon(
          icon: SvgPicture.asset(
            icon,
            height: responsiveHeight(0.025).clamp(18.0, 24.0),
            width: responsiveHeight(0.025).clamp(18.0, 24.0),
          ),
          label: Text(
            text,
            style: AppsTextStyles.workSansSemiBold16signIn.copyWith(
              fontSize: responsiveFontSize(16).clamp(14.0, 18.0),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF011F54), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF1),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if it's a tablet or large screen
            bool isTablet = constraints.maxWidth > 600;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isTablet ? 500 : double.infinity,
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Icons Row
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Assets.svgIcons.backIconSvg.svg(
                              height: iconSize,
                              width: iconSize,
                            ),
                          ),
                          SizedBox(width: responsiveWidth(0.03)),
                          Assets.svgIcons.signInPageIcon.svg(
                            height: iconSize,
                            width: iconSize,
                          ),
                        ],
                      ),
                      SizedBox(height: smallSpacing),
                      Text(
                        "SIGN IN",
                        style: AppsTextStyles.signupText.copyWith(
                          fontSize: responsiveFontSize(65).clamp(28.0, 40.0),
                        ),
                      ),
                      SizedBox(height: mediumSpacing),

                      // 📧 Email Field
                      Obx(() {
                        final isValid = controller.isEmailValid.value;
                        return TextFormField(
                          controller: controller.emailController,
                          focusNode: controller.emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) => FocusScope.of(
                            context,
                          ).requestFocus(controller.passwordFocus),
                          decoration: fieldDecoration(
                            label: "Email address",
                            hint: "",
                            labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                            suffixIcon: controller.emailController.text.isEmpty
                                ? null
                                : Padding(
                                    padding: EdgeInsets.only(
                                      right: responsiveWidth(0.03),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        isValid
                                            ? Icons.check_circle
                                            : Icons.warning_amber_rounded,
                                        size: responsiveHeight(
                                          0.025,
                                        ).clamp(18.0, 24.0),
                                        color: isValid
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      onPressed: () =>
                                          controller.emailController.clear(),
                                    ),
                                  ),
                          ),
                        );
                      }),
                      Obx(() {
                        if (!controller.isEmailValid.value &&
                            controller.emailController.text.isNotEmpty) {
                          return Column(
                            children: [
                              SizedBox(height: smallSpacing * 0.6),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: responsiveWidth(0.015),
                                ),
                                child: Text(
                                  "Please enter a valid email address.",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: responsiveFontSize(
                                      13,
                                    ).clamp(12.0, 15.0),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                      SizedBox(height: mediumSpacing),

                      // 🔒 Password Field
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocus,
                          obscureText: controller.obscurePassword.value,
                          textInputAction: TextInputAction.done,
                          decoration: fieldDecoration(
                            label: "Password",
                            hint: "*****",
                            labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscurePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: responsiveHeight(0.028).clamp(20.0, 26.0),
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mediumSpacing),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(0.02),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: responsiveFontSize(
                                  14,
                                ).clamp(12.0, 16.0),
                              ),
                            ),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.visible,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "It happens! ",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: responsiveFontSize(
                                          14,
                                        ).clamp(12.0, 16.0),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: GestureDetector(
                                        onTap: () {
                                          context.push("/resentPasswordPage");
                                        },
                                        child: Text(
                                          "Reset it here.",
                                          style: TextStyle(
                                            color: const Color(0xFF0A214D),
                                            fontSize: responsiveFontSize(
                                              14,
                                            ).clamp(12.0, 16.0),
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: mediumSpacing),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            context.push("/onboardingFlow");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8F26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Continue",
                            style: AppsTextStyles.signInContinueButton.copyWith(
                              fontSize: responsiveFontSize(
                                18,
                              ).clamp(16.0, 20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mediumSpacing),

                      // Divider with "or"
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(thickness: 2, color: Colors.black26),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(0.02),
                            ),
                            child: Text(
                              "or",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: responsiveFontSize(
                                  14,
                                ).clamp(12.0, 16.0),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(thickness: 1, color: Colors.black26),
                          ),
                        ],
                      ),
                      SizedBox(height: largeSpacing),

                      // Social Buttons
                      socialButton(
                        icon: Assets.svgIcons.signInGoole.path,
                        text: "Continue with Google",
                      ),
                      SizedBox(height: mediumSpacing),
                      socialButton(
                        icon: Assets.svgIcons.appleIconSignIn.path,
                        text: "Continue with Apple",
                      ),

                      SizedBox(
                        height: responsiveHeight(0.08).clamp(40.0, 90.0),
                      ),

                      // Sign Up Text
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Don't have an account? → ",
                            style: AppsTextStyles.workSansSemiBold16.copyWith(
                              fontSize: responsiveFontSize(
                                16,
                              ).clamp(14.0, 18.0),
                            ),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: AppsTextStyles
                                    .workSansSemiBold16SignInAlread
                                    .copyWith(
                                      fontSize: responsiveFontSize(
                                        16,
                                      ).clamp(14.0, 18.0),
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push("/signUpScreen");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: verticalPadding),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/  */