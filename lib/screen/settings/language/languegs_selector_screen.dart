import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final String currentLanguage;
  final List<String> languages;

  const LanguageSelector({
    super.key,
    required this.currentLanguage,
    this.languages = const ['English', 'Deutsch', 'Español'],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE8EDF2),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A3A52),
              ),
            ),
            const SizedBox(height: 16),
            ...languages.map(
              (language) => _buildLanguageOption(
                context,
                language,
                isSelected: language == currentLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String language, {
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => Navigator.pop(context, language),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: const TextStyle(fontSize: 16, color: Color(0xFF1A3A52)),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Color(0xFF4A90E2), size: 24),
          ],
        ),
      ),
    );
  }
}
