import 'package:flutter/material.dart';

class VoiceSelectorPopup extends StatefulWidget {
  const VoiceSelectorPopup({Key? key}) : super(key: key);

  static Future<String?> show(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const VoiceSelectorPopup(),
    );
  }

  @override
  State<VoiceSelectorPopup> createState() => _VoiceSelectorPopupState();
}

class _VoiceSelectorPopupState extends State<VoiceSelectorPopup> {
  String _selectedVoice = 'Female';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E9F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          const Text(
            'Choose voice',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 16),

          // Female option
          _buildVoiceOption('Female'),

          // Male option
          _buildVoiceOption('Male'),
        ],
      ),
    );
  }

  Widget _buildVoiceOption(String voice) {
    final isSelected = _selectedVoice == voice;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedVoice = voice;
        });
        // Close and return selected voice
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pop(context, voice);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              voice,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A8A),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Color(0xFF4C3EDD), size: 24),
          ],
        ),
      ),
    );
  }
}
