import 'package:flutter/material.dart';

// Add to HomeScreen's initState or build method:
// OnboardingOverlay.show(context);

class OnboardingOverlay {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) => const OnboardingDialog(),
    );
  }
}

class OnboardingDialog extends StatefulWidget {
  const OnboardingDialog({Key? key}) : super(key: key);

  @override
  State<OnboardingDialog> createState() => _OnboardingDialogState();
}

class _OnboardingDialogState extends State<OnboardingDialog> {
  int _step = 0;

  final List<OnboardingStep> _steps = [
    OnboardingStep(
      widget: const ChatBubbleContainer(),
      position: const Alignment(0, -0.3),
    ),
    OnboardingStep(
      widget: const ChatMessage(),
      position: const Alignment(0.5, 0),
    ),
    OnboardingStep(
      widget: const ConversationBubble(),
      position: const Alignment(-0.5, 0.4),
    ),
    OnboardingStep(
      widget: const TextBubble(),
      position: const Alignment(0, 0.6),
    ),
  ];

  void _next() {
    if (_step < _steps.length - 1) {
      setState(() => _step++);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _next,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: _steps[_step].position,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  key: ValueKey(_step),
                  child: _steps[_step].widget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingStep {
  final Widget widget;
  final Alignment position;

  OnboardingStep({required this.widget, required this.position});
}

// Bubble Widgets
class ChatBubbleContainer extends StatelessWidget {
  const ChatBubbleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubbleTail(),
      child: Container(
        width: 282,
        height: 128,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF33B24E),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            const Expanded(
              child: Text(
                "Start here. A good day begins with rest.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Next",
                  style: TextStyle(
                    color: Color(0xFF184B29),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF184B29),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 282,
      height: 128,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF33B24E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Expanded(
            child: Text(
              "Swipe left to reschedule or edit quests..",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Next",
                style: TextStyle(
                  color: Color(0xFF184B29),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF184B29)),
            ],
          ),
        ],
      ),
    );
  }
}

class ConversationBubble extends StatelessWidget {
  const ConversationBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubbleTail(),
      child: Container(
        width: 282,
        height: 128,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF33B24E),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            const Expanded(
              child: Text(
                "Tap quest cards to mark complete.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Next",
                  style: TextStyle(
                    color: Color(0xFF184B29),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF184B29),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextBubble extends StatelessWidget {
  const TextBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 282,
      height: 128,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF33B24E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Expanded(
            child: Text(
              "Let's get started on your journey!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Done",
                style: TextStyle(
                  color: Color(0xFF184B29),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.check, size: 14, color: Color(0xFF184B29)),
            ],
          ),
        ],
      ),
    );
  }
}

class BubbleTail extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(20, size.height)
        ..lineTo(32, size.height + 12)
        ..lineTo(44, size.height),
      Paint()..color = const Color(0xFF33B24E),
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
