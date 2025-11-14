import 'package:flutter/material.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class LoadingOnboridngNowli extends StatelessWidget {
  const LoadingOnboridngNowli({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFDCEEFF), // light blue background
      body: Center(child: LoadingContent()),
    );
  }
}

class LoadingContent extends StatefulWidget {
  const LoadingContent({super.key});

  @override
  State<LoadingContent> createState() => _LoadingContentState();
}

class _LoadingContentState extends State<LoadingContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (_controller.status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          })
          ..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _startDotAnimation();
  }

  void _startDotAnimation() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 250));
      setState(() {
        _currentDot = (_currentDot + 1) % 4;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    : Colors.blueAccent.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            "Hold on a sec, Nowlii is preparing your space...",
            textAlign: TextAlign.center,
            style: AppsTextStyles.extraBold32Centered,
          ),
        ),
      ],
    );
  }
}
