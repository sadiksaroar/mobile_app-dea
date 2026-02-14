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

    InputDecoration fieldDecoration({
      required String label,
      required String hint,
      Widget? suffixIcon,
      required TextStyle labelStyle,
    }) {
      const borderSide = BorderSide(color: Color(0xFFC3DBFF), width: 1);
      final borderRadius = BorderRadius.circular(30);

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
          vertical: 18,
          horizontal: 20,
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
        height: 55,
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
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Assets.svgIcons.signInPageIcon.svg(height: 80, width: 80),
                ],
              ),
              const SizedBox(height: 10),
              Text("SIGN IN", style: AppsTextStyles.signupText),
              const SizedBox(height: 10),

              // 📧 Email Field
              Obx(() {
                // Read .obs value unconditionally so GetX always detects a subscription
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
                    label: "Email Address",
                    hint: "maria@gmail.com",
                    labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                    suffixIcon: controller.emailController.text.isEmpty
                        ? null
                        : IconButton(
                            icon: Icon(
                              isValid
                                  ? Icons.check_circle
                                  : Icons.warning_amber_rounded,
                              size: 20,
                              color: isValid ? Colors.green : Colors.red,
                            ),
                            onPressed: () => controller.emailController.clear(),
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
              const SizedBox(height: 20),

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
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "It happens! ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 11,
                                decoration: TextDecoration.none, // No underline
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
                                    fontSize: 11,
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
                height: 55,
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
              const SizedBox(height: 25),

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

              const SizedBox(height: 100),

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
