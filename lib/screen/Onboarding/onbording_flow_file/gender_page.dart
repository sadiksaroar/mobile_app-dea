import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/utlis/color_palette/color_palette.dart';

class GenderPage extends StatelessWidget {
  final String userName;
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderPage({
    Key? key,
    required this.userName,
    required this.selectedGender,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Screen size for responsive spacing
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColorsApps.myColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HEY ${userName.toUpperCase()}!',
                    style: AppsTextStyles.SaimTitle28,
                  ),
                  Text(
                    'WHICH GENDER DESCRIBES YOU ?',
                    style: AppsTextStyles.SaimTitle28,
                  ),
                  const SizedBox(height: 32),
                  GenderButton(
                    text: 'I\'m a man',
                    value: 'man',
                    isSelected: selectedGender == 'man',
                    onPressed: () => onGenderSelected('man'),
                  ),
                  const SizedBox(height: 16),
                  GenderButton(
                    text: 'I\'m a woman',
                    value: 'woman',
                    isSelected: selectedGender == 'woman',
                    onPressed: () => onGenderSelected('woman'),
                  ),
                  const SizedBox(height: 16),
                  GenderButton(
                    text: 'Another gender',
                    value: 'other',
                    isSelected: selectedGender == 'other',
                    onPressed: () => onGenderSelected('other'),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      'You can always update this later. We\'ve got you.',
                      style: AppsTextStyles.WorkSansRegular14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String text;
  final String value;
  final bool isSelected;
  final VoidCallback onPressed;

  const GenderButton({
    Key? key,
    required this.text,
    required this.value,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4E5FFF) : AppColorsApps.myColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFF4E5FFF), width: 2),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.workSans(
              color: isSelected ? Colors.white : const Color(0xFF4542EB),
              fontSize: 20,
              fontWeight: FontWeight.w900,
              height: 0.80,
            ),
          ),
        ),
      ),
    );
  }
}
