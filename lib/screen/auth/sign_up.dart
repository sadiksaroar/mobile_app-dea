// // import 'package:flutter/gestures.dart' show TapGestureRecognizer;
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart' show SvgPicture;
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
// // import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

// // class SignupPage extends StatefulWidget {
// //   const SignupPage({super.key});

// //   @override
// //   State<SignupPage> createState() => _SignupPageState();
// // }

// // class _SignupPageState extends State<SignupPage> {
// //   bool _obscurePassword = true;
// //   bool _isButtonEnabled = false;

// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();

// //   final _nameFocus = FocusNode();
// //   final _emailFocus = FocusNode();
// //   final _passwordFocus = FocusNode();

// //   bool _isEmailValid = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _nameController.addListener(_validateForm);
// //     _passwordController.addListener(_validateForm);
// //   }

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     _nameFocus.dispose();
// //     _emailFocus.dispose();
// //     _passwordFocus.dispose();
// //     super.dispose();
// //   }

// //   void _validateForm() {
// //     final isValid =
// //         _nameController.text.isNotEmpty &&
// //         _emailController.text.isNotEmpty &&
// //         _passwordController.text.isNotEmpty &&
// //         _isValidEmail(_emailController.text);
// //     if (isValid != _isButtonEnabled) {
// //       setState(() => _isButtonEnabled = isValid);
// //     }
// //   }

// //   bool _isValidEmail(String email) {
// //     return RegExp(r"^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
// //   }

// //   void _onEmailChanged(String value) {
// //     final valid = value.isEmpty || _isValidEmail(value);
// //     if (valid != _isEmailValid) {
// //       setState(() => _isEmailValid = valid);
// //     }
// //     _validateForm();
// //   }

// //   InputDecoration _fieldDecoration({
// //     required String label,
// //     required String hint,
// //     Widget? suffixIcon,
// //     bool showError = false,
// //     required TextStyle labelStyle,
// //   }) {
// //     final borderRadius = BorderRadius.circular(15);
// //     final normalBorder = OutlineInputBorder(
// //       borderRadius: borderRadius,
// //       borderSide: BorderSide.none,
// //       gapPadding: 8,
// //     );
// //     final highlightBorder = OutlineInputBorder(
// //       borderRadius: borderRadius,
// //       borderSide: BorderSide(
// //         color: showError ? Colors.red : const Color(0xFF4A3AFF),
// //         width: 2,
// //       ),
// //       gapPadding: 8,
// //     );

// //     return InputDecoration(
// //       labelText: label,
// //       hintText: hint,
// //       floatingLabelBehavior: FloatingLabelBehavior.auto,
// //       floatingLabelAlignment: FloatingLabelAlignment.start,
// //       floatingLabelStyle: TextStyle(
// //         color: showError ? Colors.red : const Color(0xFF4A3AFF),
// //         fontWeight: FontWeight.w600,
// //         fontSize: 14,
// //       ),
// //       labelStyle: const TextStyle(color: Colors.black54),
// //       filled: true,
// //       fillColor: Colors.white,
// //       contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
// //       enabledBorder: normalBorder,
// //       focusedBorder: highlightBorder,
// //       errorBorder: highlightBorder,
// //       focusedErrorBorder: highlightBorder,
// //       suffixIcon: suffixIcon,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // backgroundColor: const Color(0xFFDDEBFF),
// //       backgroundColor: const Color(0xFFDFEFFF),
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // 🔙 Back button + Logo Row
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   // 🔙 Back SVG icon
// //                   GestureDetector(
// //                     child: Assets.svgIcons.signUnBackScrren.svg(
// //                       height: 60,
// //                       width: 60,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 12),

// //                   // 🖼️ App Store logo (same size)
// //                   Assets.svgIcons.appStoreAppIconSvg.svg(height: 80, width: 80),
// //                 ],
// //               ),

// //               const SizedBox(height: 20),

// //               Text("SIGN UP", style: AppsTextStyles.signupText),
// //               const SizedBox(height: 40),

// //               // 🧑 Name Field
// //               TextFormField(
// //                 controller: _nameController,
// //                 focusNode: _nameFocus,
// //                 textInputAction: TextInputAction.next,
// //                 onFieldSubmitted: (_) =>
// //                     FocusScope.of(context).requestFocus(_emailFocus),
// //                 decoration: _fieldDecoration(
// //                   label: "Full Name",
// //                   labelStyle:
// //                       AppsTextStyles.fullNameAndEmail, // use the class style

// //                   hint: "Maria",
// //                   suffixIcon: _nameController.text.isNotEmpty
// //                       ? IconButton(
// //                           icon: const Icon(Icons.close),
// //                           onPressed: () => _nameController.clear(),
// //                         )
// //                       : null,
// //                 ),
// //               ),
// //               const SizedBox(height: 25),

// //               // 📧 Email Field
// //               TextFormField(
// //                 controller: _emailController,
// //                 focusNode: _emailFocus,
// //                 keyboardType: TextInputType.emailAddress,
// //                 textInputAction: TextInputAction.next,
// //                 onFieldSubmitted: (_) =>
// //                     FocusScope.of(context).requestFocus(_passwordFocus),
// //                 decoration: _fieldDecoration(
// //                   label: "Email Address",
// //                   labelStyle:
// //                       AppsTextStyles.fullNameAndEmail, // use the class style

// //                   hint: "maria@gmail.com",
// //                   showError: !_isEmailValid && _emailController.text.isNotEmpty,
// //                   suffixIcon: _emailController.text.isEmpty
// //                       ? null
// //                       : IconButton(
// //                           icon: Icon(
// //                             _isEmailValid
// //                                 ? Icons.check_circle
// //                                 : Icons.warning_amber_rounded,
// //                             size: 20,
// //                             color: _isEmailValid ? Colors.green : Colors.red,
// //                           ),
// //                           onPressed: () => _emailController.clear(),
// //                         ),
// //                 ),
// //                 onChanged: _onEmailChanged,
// //               ),
// //               if (!_isEmailValid && _emailController.text.isNotEmpty) ...[
// //                 const SizedBox(height: 6),
// //                 const Padding(
// //                   padding: EdgeInsets.only(left: 6),
// //                   child: Text(
// //                     "Please enter a valid email address.",
// //                     style: TextStyle(color: Colors.red, fontSize: 13),
// //                   ),
// //                 ),
// //               ],
// //               const SizedBox(height: 20),

// //               // 🔒 Password Field
// //               TextFormField(
// //                 controller: _passwordController,
// //                 focusNode: _passwordFocus,
// //                 obscureText: _obscurePassword,
// //                 textInputAction: TextInputAction.done,
// //                 decoration: _fieldDecoration(
// //                   label: "Password",
// //                   labelStyle:
// //                       AppsTextStyles.fullNameAndEmail, // use the class style

// //                   hint: "*****",
// //                   suffixIcon: IconButton(
// //                     icon: Icon(
// //                       _obscurePassword
// //                           ? Icons.visibility_off
// //                           : Icons.visibility,
// //                     ),
// //                     onPressed: () =>
// //                         setState(() => _obscurePassword = !_obscurePassword),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),

// //               // const Text(
// //               //   "By signing up, you agree to Nowlii’s Privacy Policy & Terms of Service.",
// //               //   style: TextStyle(fontSize: 1, color: Colors.black54),
// //               // ),
// //               RichText(
// //                 text: TextSpan(
// //                   style: GoogleFonts.workSans(
// //                     fontWeight: FontWeight.w400,
// //                     fontSize: 14, // Default size for normal text
// //                     color: Colors.black54,
// //                   ),
// //                   children: [
// //                     const TextSpan(
// //                       text: "By signing up, you agree to Nowlii’s ",
// //                       style: TextStyle(fontSize: 12, color: Colors.black54),
// //                     ),
// //                     TextSpan(
// //                       text: "Privacy Policy",
// //                       style: GoogleFonts.workSans(
// //                         fontWeight: FontWeight.w700,
// //                         fontSize: 16,
// //                         color: const Color(0xFF4542EB),
// //                         decoration: TextDecoration.underline,
// //                       ),
// //                       recognizer: TapGestureRecognizer()
// //                         ..onTap = () {
// //                           // Handle Privacy Policy click
// //                         },
// //                     ),
// //                     const TextSpan(text: " & "),
// //                     TextSpan(
// //                       text: "Terms of Service",
// //                       style: GoogleFonts.workSans(
// //                         fontWeight: FontWeight.w700,
// //                         fontSize: 16,
// //                         color: const Color(0xFF4542EB),
// //                         decoration: TextDecoration.underline,
// //                       ),
// //                       recognizer: TapGestureRecognizer()
// //                         ..onTap = () {
// //                           // Handle Terms of Service click
// //                         },
// //                     ),
// //                     const TextSpan(text: "."),
// //                   ],
// //                 ),
// //               ),

// //               const SizedBox(height: 30),

// //               SizedBox(
// //                 width: double.infinity,
// //                 height: 55,
// //                 child: ElevatedButton(
// //                   onPressed: _isButtonEnabled ? () {} : null,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF4A3AFF),
// //                     disabledBackgroundColor: const Color(0xFF4A3AFF),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                   ),
// //                   child: Text(
// //                     "Continue",
// //                     style: AppsTextStyles.continueButton.copyWith(
// //                       color: _isButtonEnabled
// //                           ? Colors.white
// //                           : const Color(0xFFA9A8F6),
// //                     ),
// //                   ),
// //                 ),
// //               ),

// //               const SizedBox(height: 25),

// //               Row(
// //                 children: const [
// //                   Expanded(child: Divider(thickness: 2, color: Colors.black26)),
// //                   Padding(
// //                     padding: EdgeInsets.symmetric(horizontal: 8),
// //                     child: Text("or", style: TextStyle(color: Colors.black54)),
// //                   ),
// //                   Expanded(child: Divider(thickness: 1, color: Colors.black26)),
// //                 ],
// //               ),
// //               const SizedBox(height: 25),

// //               _socialButton(icon: Assets.svgIcons.googleIconsBlue.path, text: "Continue with Google"),

// //               const SizedBox(height: 15),
// //               _socialButton(icon: Assets.svgIcons.appleIcon.path, text: "Continue with Apple"),
// //               const SizedBox(height: 30),

// //               Center(
// //                 child: RichText(
// //                   text: const TextSpan(
// //                     text: "Already have an account? ",
// //                     style: TextStyle(color: Colors.black87),
// //                     children: [
// //                       TextSpan(
// //                         text: "Sign in",
// //                         style: TextStyle(
// //                           color: Color(0xFF4A3AFF),
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _socialButton({required IconData icon, required String text}) {
// //     return SizedBox(
// //       width: double.infinity,
// //       height: 55,
// //       child: OutlinedButton.icon(
// //         icon: Icon(icon, size: 30, color: Color(0xFF4542EB)),
// //         label: Text(text, style: AppsTextStyles.googleContinueButton),
// //         style: OutlinedButton.styleFrom(
// //           side: const BorderSide(
// //             color: Color(0xFF4542EB),
// //             width: 2, // Border thickness
// //           ),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //           // backgroundColor: const Color(0xFFDDEBFF), // optional
// //         ),
// //         onPressed: () {},
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart' show SvgPicture;
// import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
// import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   bool _obscurePassword = true;
//   bool _isButtonEnabled = false;

//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   final _nameFocus = FocusNode();
//   final _emailFocus = FocusNode();
//   final _passwordFocus = FocusNode();

//   bool _isEmailValid = true;

//   @override
//   void initState() {
//     super.initState();
//     _nameController.addListener(_validateForm);
//     _emailController.addListener(() {
//       _onEmailChanged(_emailController.text); // Fixed listener
//     });
//     _passwordController.addListener(_validateForm);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameFocus.dispose();
//     _emailFocus.dispose();
//     _passwordFocus.dispose();
//     super.dispose();
//   }

//   void _validateForm() {
//     final isValid =
//         _nameController.text.isNotEmpty &&
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
//     bool showError = false,
//     required TextStyle labelStyle,
//   }) {
//     final borderRadius = BorderRadius.circular(15);
//     final normalBorder = OutlineInputBorder(
//       borderRadius: borderRadius,
//       borderSide: BorderSide.none,
//       gapPadding: 8,
//     );
//     final highlightBorder = OutlineInputBorder(
//       borderRadius: borderRadius,
//       borderSide: BorderSide(
//         color: showError ? Colors.red : const Color(0xFF4A3AFF),
//         width: 2,
//       ),
//       gapPadding: 8,
//     );

//     return InputDecoration(
//       labelText: label,
//       hintText: hint,
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       floatingLabelAlignment: FloatingLabelAlignment.start,
//       floatingLabelStyle: TextStyle(
//         color: showError ? Colors.red : const Color(0xFF4A3AFF),
//         fontWeight: FontWeight.w600,
//         fontSize: 14,
//       ),
//       labelStyle: const TextStyle(color: Colors.black54),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
//       enabledBorder: normalBorder,
//       focusedBorder: highlightBorder,
//       errorBorder: highlightBorder,
//       focusedErrorBorder: highlightBorder,
//       suffixIcon: suffixIcon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFDFEFFF),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context), // Back button action
//                     child: Assets.svgIcons.signUnBackScrren.svg(
//                       height: 60,
//                       width: 60,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Assets.svgIcons.appStoreAppIconSvg.svg(height: 80, width: 80),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text("SIGN UP", style: AppsTextStyles.signupText),
//               const SizedBox(height: 10),

//               // 🧑 Name Field
//               TextFormField(
//                 controller: _nameController,
//                 focusNode: _nameFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) =>
//                     FocusScope.of(context).requestFocus(_emailFocus),
//                 decoration: _fieldDecoration(
//                   label: "Full Name",
//                   labelStyle: AppsTextStyles.fullNameAndEmail,
//                   hint: "Maria",
//                   suffixIcon: _nameController.text.isNotEmpty
//                       ? IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => _nameController.clear(),
//                         )
//                       : null,
//                 ),
//               ),
//               const SizedBox(height: 25),

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
//                   labelStyle: AppsTextStyles.fullNameAndEmail,
//                   hint: "maria@gmail.com",
//                   showError: !_isEmailValid && _emailController.text.isNotEmpty,
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
//                   labelStyle: AppsTextStyles.fullNameAndEmail,
//                   hint: "*****",
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

//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: _isButtonEnabled ? () {} : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4A3AFF),
//                     disabledBackgroundColor: const Color(0xFF4A3AFF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Text(
//                     "Continue",
//                     style: AppsTextStyles.continueButton.copyWith(
//                       color: _isButtonEnabled
//                           ? Colors.white
//                           : const Color(0xFFA9A8F6),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),

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

//               _socialButton(
//                 icon: Assets.svgIcons.googleIconsBlue.path,
//                 text: "Continue with Google",
//               ),

//               const SizedBox(height: 15),
//               _socialButton(
//                 icon: Assets.svgIcons.appleIconsBlue.path,
//                 text: "Continue with Apple",
//               ),

//               const SizedBox(height: 30),

//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     // removed 'const'
//                     text: "Already have an account? → ",
//                     style: AppsTextStyles.workSansSemiBold16,
//                     children: [
//                       TextSpan(
//                         text: "Sign in",
//                         style: AppsTextStyles
//                             .workSansSemiBold16SignInalredy, // make sure this exists
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
//         label: Text(text, style: AppsTextStyles.googleContinueButton),
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Color(0xFF4542EB), width: 2),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  bool _isButtonEnabled = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _isEmailValid = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _emailController.addListener(() {
      _onEmailChanged(_emailController.text);
    });
    _passwordController.addListener(_validateForm);

    // 👇 Add listeners to rebuild UI when focus changes
    _nameFocus.addListener(() => setState(() {}));
    _emailFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  // ✅ Check if any field is focused
  bool get _isAnyFieldFocused =>
      _nameFocus.hasFocus || _emailFocus.hasFocus || _passwordFocus.hasFocus;

  void _validateForm() {
    final isValid =
        _nameController.text.isNotEmpty &&
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
    bool showError = false,
    required TextStyle labelStyle,
  }) {
    final borderRadius = BorderRadius.circular(15);
    final normalBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide.none,
      gapPadding: 8,
    );
    final highlightBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: showError ? Colors.red : const Color(0xFF4A3AFF),
        width: 2,
      ),
      gapPadding: 8,
    );

    return InputDecoration(
      labelText: label,
      hintText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelStyle: TextStyle(
        color: showError ? Colors.red : const Color(0xFF4A3AFF),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      labelStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      enabledBorder: normalBorder,
      focusedBorder: highlightBorder,
      errorBorder: highlightBorder,
      focusedErrorBorder: highlightBorder,
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFEFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔙 Back button + logo
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Assets.svgIcons.signUnBackScrren.svg(
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(width: 12),
            Assets.svgIcons.appStoreAppIconSvg.svg(height: 80, width: 80),
          ],
        ),
        const SizedBox(height: 10),
        Text("SIGN UP", style: AppsTextStyles.signupText),
        const SizedBox(height: 10),

        // 🧑 Name Field
        TextFormField(
          controller: _nameController,
          focusNode: _nameFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(_emailFocus),
          decoration: _fieldDecoration(
            label: "Full Name",
            labelStyle: AppsTextStyles.fullNameAndEmail,
            hint: "Maria",
            suffixIcon: _nameController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => _nameController.clear(),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 25),

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
            labelStyle: AppsTextStyles.fullNameAndEmail,
            hint: "maria@gmail.com",
            showError: !_isEmailValid && _emailController.text.isNotEmpty,
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
            labelStyle: AppsTextStyles.fullNameAndEmail,
            hint: "*****",
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // 🔘 Continue Button
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: _isButtonEnabled ? () {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A3AFF),
              disabledBackgroundColor: const Color(0xFF4A3AFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: AppsTextStyles.continueButton.copyWith(
                color: _isAnyFieldFocused
                    ? Colors.white
                    : const Color(0xFFA9A8F6),
              ),
              child: const Text("Continue"),
            ),
          ),
        ),
        const SizedBox(height: 25),

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

        _socialButton(
          icon: Assets.svgIcons.googleIconsBlue.path,
          text: "Continue with Google",
        ),
        const SizedBox(height: 15),
        _socialButton(
          icon: Assets.svgIcons.appleIconsBlue.path,
          text: "Continue with Apple",
        ),
        const SizedBox(height: 30),

        Center(
          child: RichText(
            text: TextSpan(
              text: "Already have an account? → ",
              style: AppsTextStyles.workSansSemiBold16,
              children: [
                TextSpan(
                  text: "Sign in",
                  style: AppsTextStyles.workSansSemiBold16SignInalredy,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButton({required String icon, required String text}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        icon: SvgPicture.asset(icon, height: 20, width: 20),
        label: Text(text, style: AppsTextStyles.googleContinueButton),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF4542EB), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
