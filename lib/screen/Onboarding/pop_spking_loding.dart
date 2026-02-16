import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class PopSpkingLoding extends StatefulWidget {
  const PopSpkingLoding({super.key});

  @override
  State<PopSpkingLoding> createState() => _PopSpkingLodingState();
}

class _PopSpkingLodingState extends State<PopSpkingLoding> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFEF8), // light blue background
      body: Center(child: LoadingContent()),
    );
  }
}

class LoadingContent extends StatefulWidget {
  const LoadingContent({super.key});

  @override
  State<LoadingContent> createState() => _LoadingContentState();
}

class _LoadingContentState extends State<LoadingContent> {
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();
    _startDotAnimation();
  }

  void _startDotAnimation() async {
    // Run animation for 3 seconds, then navigate
    int elapsedTime = 0;
    while (mounted && elapsedTime < 3000) {
      await Future.delayed(const Duration(milliseconds: 250));
      elapsedTime += 250;
      if (mounted) {
        setState(() {
          _currentDot = (_currentDot + 1) % 4;
        });
      }
    }
    if (mounted) {
      context.go(AppRoutespath.popupChooseMoodUpdates);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Animated dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: index == _currentDot
                    ? Colors.blueAccent
                    : Colors.blueAccent.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            "Nowlii is preparing your safe space...",
            textAlign: TextAlign.center,
            style: AppsTextStyles.extraBold32Centered,
          ),
        ),
      ],
    );
  }
}
