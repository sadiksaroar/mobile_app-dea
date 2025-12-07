// import 'package:flutter/gestures.dart' show TapGestureRecognizer;
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart' show SvgPicture;
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
// import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   bool _obscurePassword = true;
//   bool _isButtonEnabled = false;

//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   final _emailFocus = FocusNode();
//   final _passwordFocus = FocusNode();

//   bool _isEmailValid = true;

//   @override
//   void initState() {
//     super.initState();
//     _emailController.addListener(() => _onEmailChanged(_emailController.text));
//     _passwordController.addListener(_validateForm);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocus.dispose();
//     _passwordFocus.dispose();
//     super.dispose();
//   }

//   void _validateForm() {
//     final isValid =
//         _emailController.text.isNotEmpty &&
//         _passwordController.text.isNotEmpty &&
//         _isValidEmail(_emailController.text);
//     if (isValid != _isButtonEnabled) {
//       setState(() => _isButtonEnabled = isValid);
//     }
//   }

//   bool _isValidEmail(String email) {
//     return RegExp(r"^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
//   }

//   void _onEmailChanged(String value) {
//     final valid = value.isEmpty || _isValidEmail(value);
//     if (valid != _isEmailValid) {
//       setState(() => _isEmailValid = valid);
//     }
//     _validateForm();
//   }

//   InputDecoration _fieldDecoration({
//     required String label,
//     required String hint,
//     Widget? suffixIcon,
//     required TextStyle labelStyle,
//   }) {
//     const borderSide = BorderSide(color: const Color(0xFFC3DBFF), width: 1);
//     final borderRadius = BorderRadius.circular(30);

//     final fixedBorder = OutlineInputBorder(
//       borderRadius: borderRadius,
//       borderSide: borderSide,
//       gapPadding: 8,
//     );

//     return InputDecoration(
//       labelText: label,
//       hintText: hint,
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       floatingLabelAlignment: FloatingLabelAlignment.start,
//       floatingLabelStyle: labelStyle,
//       labelStyle: const TextStyle(color: Colors.black54),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
//       enabledBorder: fixedBorder,
//       focusedBorder: fixedBorder,
//       errorBorder: fixedBorder.copyWith(
//         borderSide: const BorderSide(color: Colors.red, width: 2),
//       ),
//       focusedErrorBorder: fixedBorder.copyWith(
//         borderSide: const BorderSide(color: Colors.red, width: 2),
//       ),
//       suffixIcon: suffixIcon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFCF1),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top Icons Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Assets.svgIcons.backIconSvg.svg(
//                       height: 60,
//                       width: 60,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Assets.svgIcons.signInPageIcon.svg(height: 80, width: 80),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text("SIGN IN", style: AppsTextStyles.signupText),
//               const SizedBox(height: 10),

//               // 📧 Email Field
//               TextFormField(
//                 controller: _emailController,
//                 focusNode: _emailFocus,
//                 keyboardType: TextInputType.emailAddress,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) =>
//                     FocusScope.of(context).requestFocus(_passwordFocus),
//                 decoration: _fieldDecoration(
//                   label: "Email Address",
//                   hint: "maria@gmail.com",
//                   labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
//                   suffixIcon: _emailController.text.isEmpty
//                       ? null
//                       : IconButton(
//                           icon: Icon(
//                             _isEmailValid
//                                 ? Icons.check_circle
//                                 : Icons.warning_amber_rounded,
//                             size: 20,
//                             color: _isEmailValid ? Colors.green : Colors.red,
//                           ),
//                           onPressed: () => _emailController.clear(),
//                         ),
//                 ),
//                 onChanged: _onEmailChanged,
//               ),
//               if (!_isEmailValid && _emailController.text.isNotEmpty) ...[
//                 const SizedBox(height: 6),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 6),
//                   child: Text(
//                     "Please enter a valid email address.",
//                     style: TextStyle(color: Colors.red, fontSize: 13),
//                   ),
//                 ),
//               ],
//               const SizedBox(height: 20),

//               // 🔒 Password Field
//               TextFormField(
//                 controller: _passwordController,
//                 focusNode: _passwordFocus,
//                 obscureText: _obscurePassword,
//                 textInputAction: TextInputAction.done,
//                 decoration: _fieldDecoration(
//                   label: "Password",
//                   hint: "*****",
//                   labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () =>
//                         setState(() => _obscurePassword = !_obscurePassword),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Forgot password?",
//                     style: TextStyle(color: Colors.black87, fontSize: 16),
//                   ),

//                   const SizedBox(width: 10),

//                   const Text(
//                     "It happens!",
//                     style: TextStyle(color: Colors.black87, fontSize: 16),
//                   ),

//                   const SizedBox(width: 10),

//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to Reset Password Screen
//                     },
//                     child: const Text(
//                       "Reset it here.",
//                       style: TextStyle(
//                         color: Color(0xFF0A214D), // Dark blue like screenshot
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: _isButtonEnabled
//                       ? () {
//                           context.push("/onboardingFlow");
//                         }
//                       : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF8F26),
//                     disabledBackgroundColor: const Color(0xFFFF8F26),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Text(
//                     "Continue",
//                     style: AppsTextStyles.signInContinueButton,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),

//               // Divider with "or"
//               Row(
//                 children: const [
//                   Expanded(child: Divider(thickness: 2, color: Colors.black26)),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     child: Text("or", style: TextStyle(color: Colors.black54)),
//                   ),
//                   Expanded(child: Divider(thickness: 1, color: Colors.black26)),
//                 ],
//               ),
//               const SizedBox(height: 25),

//               // Social Buttons
//               _socialButton(
//                 icon: Assets.svgIcons.signInGoole.path,
//                 text: "Continue with Google",
//               ),
//               const SizedBox(height: 15),
//               _socialButton(
//                 icon: Assets.svgIcons.appleIconSignIn.path,
//                 text: "Continue with Apple",
//               ),
//               // const SizedBox(height: 30),
//               // Divider(),
//               // Spacer(),
//               SizedBox(height: 140),
//               // Sign In Text
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     text: "Don't have an account? → ",
//                     style: AppsTextStyles.workSansSemiBold16,
//                     children: [
//                       TextSpan(
//                         text: "Sign up",
//                         style: AppsTextStyles.workSansSemiBold16SignInAlread,
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             // Navigate to the Sign-Up page
//                             context.push("/signUpScreen");
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _socialButton({required String icon, required String text}) {
//     return SizedBox(
//       width: double.infinity,
//       height: 55,
//       child: OutlinedButton.icon(
//         icon: SvgPicture.asset(icon, height: 20, width: 20),
//         label: Text(text, style: AppsTextStyles.workSansSemiBold16signIn),
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Color(0xFF011F54), width: 2),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;
  bool _isButtonEnabled = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _isEmailValid = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => _onEmailChanged(_emailController.text));
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid =
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _isValidEmail(_emailController.text);
    if (isValid != _isButtonEnabled) {
      setState(() => _isButtonEnabled = isValid);
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r"^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  void _onEmailChanged(String value) {
    final valid = value.isEmpty || _isValidEmail(value);
    if (valid != _isEmailValid) {
      setState(() => _isEmailValid = valid);
    }
    _validateForm();
  }

  InputDecoration _fieldDecoration({
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
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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

  @override
  Widget build(BuildContext context) {
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
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_passwordFocus),
                decoration: _fieldDecoration(
                  label: "Email Address",
                  hint: "maria@gmail.com",
                  labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                  suffixIcon: _emailController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(
                            _isEmailValid
                                ? Icons.check_circle
                                : Icons.warning_amber_rounded,
                            size: 20,
                            color: _isEmailValid ? Colors.green : Colors.red,
                          ),
                          onPressed: () => _emailController.clear(),
                        ),
                ),
                onChanged: _onEmailChanged,
              ),
              if (!_isEmailValid && _emailController.text.isNotEmpty) ...[
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    "Please enter a valid email address.",
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              ],
              const SizedBox(height: 20),

              // 🔒 Password Field
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                decoration: _fieldDecoration(
                  label: "Password",
                  hint: "*****",
                  labelStyle: AppsTextStyles.fullNameAndEmailSignIn,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
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
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          context.push("/onboardingFlow");
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8F26),
                    disabledBackgroundColor: const Color(0xFFFF8F26),
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
              _socialButton(
                icon: Assets.svgIcons.signInGoole.path,
                text: "Continue with Google",
              ),
              const SizedBox(height: 15),
              _socialButton(
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

  Widget _socialButton({required String icon, required String text}) {
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
}
