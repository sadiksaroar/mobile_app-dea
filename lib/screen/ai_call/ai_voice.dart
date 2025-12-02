import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class AiVoice extends StatefulWidget {
  const AiVoice({super.key});

  @override
  State<AiVoice> createState() => _AiVoiceState();
}

class _AiVoiceState extends State<AiVoice> {
  int currentSeconds = 81; // 01:21
  final int totalSeconds = 600; // 10:00
  bool isPaused = true;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (isPaused) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (currentSeconds > 0) {
          setState(() => currentSeconds--);
        } else {
          timer.cancel();
        }
      });
    } else {
      _timer?.cancel();
    }
    setState(() => isPaused = !isPaused);
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.svgImages.popupScreeLiner.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Title Section
              Text('Answer emails 📧', style: AppsTextStyles.black24Uppercase),
              const SizedBox(height: 8),
              Text(
                'You\'re doing great — keep it going',
                style: AppsTextStyles.regular16l,
              ),

              const Spacer(),

              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 266,
                    height: 253,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.svgImages.callStarted.image().image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Timer Display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isPaused ? Icons.pause : Icons.play_arrow,
                    color: const Color(0xFF3949AB),
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: _formatTime(currentSeconds),
                          style: AppsTextStyles.SaimTitle44,
                        ),
                        TextSpan(
                          text: ' / ${_formatTime(totalSeconds)}',
                          style: AppsTextStyles.alphaTitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Control Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sound button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up),
                      color: const Color(0xFF3949AB),
                      iconSize: 28,
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Mute button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_off),
                      color: const Color(0xFF3949AB),
                      iconSize: 28,
                    ),
                  ),
                  const SizedBox(width: 60),

                  // Mark as done button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.push("/homeScreen");
                      },
                      icon: const Icon(Icons.check),
                      color: const Color(0xFF3949AB),
                      iconSize: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Mark as done',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF3949AB),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
