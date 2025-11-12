// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   bool _obscurePassword = true;
//   bool _isButtonEnabled = false;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   void _validateForm() {
//     final bool isValid =
//         _nameController.text.isNotEmpty &&
//         _emailController.text.isNotEmpty &&
//         _passwordController.text.isNotEmpty &&
//         _isValidEmail(_emailController.text);
//     setState(() {
//       _isButtonEnabled = isValid;
//     });
//   }

//   bool _isValidEmail(String email) {
//     // Simple email validation
//     return RegExp(
//       r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
//     ).hasMatch(email);
//   }

//   final _nameFocus = FocusNode();
//   final _emailFocus = FocusNode();

//   bool _isEmailValid = true;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _nameFocus.dispose();
//     _emailFocus.dispose();
//     super.dispose();
//   }

//   void _validateEmail(String value) {
//     setState(() {
//       _isEmailValid = RegExp(
//         r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
//       ).hasMatch(value);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFDDEBFF), // Light blue background
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "SIGN UP",

//                 style: AppsTextStyles.signupText,
//               ),
//               const SizedBox(height: 40),

//               TextFormField(
//                 controller: _nameController,
//                 focusNode: _nameFocus,
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                   hintText: "Maria",
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 18,
//                     horizontal: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF4A3AFF),
//                       width: 2,
//                     ),
//                   ),
//                   suffixIcon: _nameController.text.isNotEmpty
//                       ? IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () {
//                             setState(() {
//                               _nameController.clear();
//                             });
//                           },
//                         )
//                       : null,
//                 ),
//                 onChanged: (_) => setState(() {}),
//               ),
//               const SizedBox(height: 25),

//               // ✅ Email Field
//               TextFormField(
//                 controller: _emailController,
//                 focusNode: _emailFocus,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                  labelText: "Full Name",
//                   hintText: "maria@gmail.com",
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 18,
//                     horizontal: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(
//                       color: _isEmailValid
//                           ? const Color(0xFF4A3AFF)
//                           : Colors.red,
//                       width: 2,
//                     ),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(color: Colors.red, width: 2),
//                   ),
//                   suffixIcon: _emailController.text.isNotEmpty
//                       ? IconButton(
//                           icon: const Icon(
//                             Icons.warning_amber_rounded,
//                             size: 18,
//                             color: Colors.red,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _emailController.clear();
//                               _isEmailValid = true;
//                             });
//                           },
//                         )
//                       : null,
//                 ),
//                 onChanged: (value) => _validateEmail(value),
//               ),

//               // ⚠️ Error message (if invalid email)
//               if (!_isEmailValid) ...[
//                 const SizedBox(height: 6),
//                 Row(
//                   children: const [
//                     SizedBox(width: 6),
//                     Text(
//                       "Please enter a valid email address.",
//                       style: TextStyle(color: Colors.red, fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ],

//               const SizedBox(height: 20),

//               // Password Field
//               TextField(
//                 controller: _passwordController,
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "*****",
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 18,
//                     horizontal: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//                 onChanged: (_) => _validateForm(),
//               ),
//               const SizedBox(height: 20),

//               // Privacy & Terms
//               const Text(
//                 "By signing up, you agree to Nowlii’s Privacy Policy & Terms of Service.",
//                 style: TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//               const SizedBox(height: 30),

//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: () {}, // Disabled state
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(
//                       0xFF4A3AFF,
//                     ), // Blue background remains fixed
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Text(
//                     "Continue",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: _isButtonEnabled
//                           ? Colors.white
//                           : const Color(
//                               0xFFA9A8F6,
//                             ), // Change text color based on button enabled state
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),

//               // Divider with "or"
//               Row(
//                 children: const [
//                   Expanded(child: Divider(thickness: 1, color: Colors.black26)),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     child: Text("or", style: TextStyle(color: Colors.black54)),
//                   ),
//                   Expanded(child: Divider(thickness: 1, color: Colors.black26)),
//                 ],
//               ),
//               const SizedBox(height: 25),

//               // Google Button
//               _socialButton(
//                 icon: Icons.g_mobiledata,
//                 text: "Continue with Google",
//               ),
//               const SizedBox(height: 15),

//               // Apple Button
//               _socialButton(icon: Icons.apple, text: "Continue with Apple"),
//               const SizedBox(height: 30),

//               // Sign in Text
//               Center(
//                 child: RichText(
//                   text: const TextSpan(
//                     text: "Already have an account? ",
//                     style: TextStyle(color: Colors.black87),
//                     children: [
//                       TextSpan(
//                         text: "Sign in",
//                         style: TextStyle(
//                           color: Color(0xFF4A3AFF),
//                           fontWeight: FontWeight.bold,
//                         ),
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

//   Widget _socialButton({required IconData icon, required String text}) {
//     return SizedBox(
//       width: double.infinity,
//       height: 55,
//       child: OutlinedButton.icon(
//         icon: Icon(icon, size: 24, color: Colors.black),
//         label: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Colors.blueAccent),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           backgroundColor: const Color(0xFFDDEBFF),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
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
    _passwordController.addListener(_validateForm);
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
      backgroundColor: const Color(0xFFDDEBFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SIGN UP", style: AppsTextStyles.signupText),
              const SizedBox(height: 40),

              TextFormField(
                controller: _nameController,
                focusNode: _nameFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_emailFocus),
                decoration: _fieldDecoration(
                  label: "Full Name",
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

              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                decoration: _fieldDecoration(
                  label: "Password",
                  hint: "*****",
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
              const SizedBox(height: 20),

              const Text(
                "By signing up, you agree to Nowlii’s Privacy Policy & Terms of Service.",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 30),

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
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _isButtonEnabled
                          ? Colors.white
                          : const Color(0xFFA9A8F6),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1, color: Colors.black26)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or", style: TextStyle(color: Colors.black54)),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.black26)),
                ],
              ),
              const SizedBox(height: 25),

              _socialButton(
                icon: Icons.g_mobiledata,
                text: "Continue with Google",
              ),
              const SizedBox(height: 15),
              _socialButton(icon: Icons.apple, text: "Continue with Apple"),
              const SizedBox(height: 30),

              Center(
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          color: Color(0xFF4A3AFF),
                          fontWeight: FontWeight.bold,
                        ),
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

  Widget _socialButton({required IconData icon, required String text}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        icon: Icon(icon, size: 24, color: Colors.black),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blueAccent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color(0xFFDDEBFF),
        ),
        onPressed: () {},
      ),
    );
  }
}
