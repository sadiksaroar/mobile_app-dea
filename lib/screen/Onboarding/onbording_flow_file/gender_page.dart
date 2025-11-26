import 'package:flutter/material.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HEY ${userName.toUpperCase()}!',
            style: AppsTextStyles.SaimTitle,
          ),
          Text('WHICH GENDER DESCRIBES YOU?', style: AppsTextStyles.SaimTitle),
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
        ],
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? const Color(0xFF4E5FFF)
              : Color(0xFFD6E4F0),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: isSelected
                  ? const Color(0xFF4E5FFF)
                  : const Color(0xFF4E5FFF).withOpacity(0.3),
              width: 2,
            ),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: isSelected ? Colors.white : const Color(0xFF4E5FFF),
          ),
        ),
      ),
    );
  }
}
