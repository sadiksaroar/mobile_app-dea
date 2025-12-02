import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart' show Assets;
import 'package:mobile_app_dea/themes/text_styles.dart' show AppsTextStyles;

class ResentPasswordPage extends StatefulWidget {
  const ResentPasswordPage({super.key});

  @override
  State<ResentPasswordPage> createState() => _ResentPasswordPageState();
}

class _ResentPasswordPageState extends State<ResentPasswordPage> {
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
    const borderSide = BorderSide(color: const Color(0xFFC3DBFF), width: 1);
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Assets.svgIcons.backIconPng.image(
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Assets.svgIcons.signInPageIcon.svg(height: 80, width: 80),
                ],
              ),
              Text("Reset Password", style: AppsTextStyles.resetPassword),
              SizedBox(height: 10),
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

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8F26),
                    disabledBackgroundColor: const Color(0xFFFF8F26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Send Reset Link",
                    style: AppsTextStyles.sendResetLinkButton,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Divider with "or"

              // Sign In Text
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Didn’t get the email? → ",
                    style: AppsTextStyles.didNotGetEmail,
                    children: [
                      TextSpan(
                        text: "Resend link",
                        style: AppsTextStyles.resendLink,
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
