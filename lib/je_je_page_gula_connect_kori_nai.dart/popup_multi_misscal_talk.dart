import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';

class PopupMultiMisscalTalk extends StatefulWidget {
  const PopupMultiMisscalTalk({super.key});

  @override
  State<PopupMultiMisscalTalk> createState() => _PopupMultiMisscalTalkState();
}

class _PopupMultiMisscalTalkState extends State<PopupMultiMisscalTalk>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideUp = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image (fills behind the popup)
          Positioned.fill(
            child: Image.asset(
              'assets/images/Popup_Multiple Missed Talks_png.png',
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          FadeTransition(
            opacity: _fadeIn,
            child: SlideTransition(
              position: _slideUp,
              child: SafeArea(
                child: Column(
                  children: [
                    const Spacer(flex: 3),

                    SizedBox(height: 15),
                    // Fuzzy avatar card
                    Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(Assets.images.carton.path),
                    ),

                    const Spacer(flex: 2),

                    // Title
                    SizedBox(
                      width: 310,
                      child: Text(
                        'HEY JULIE, YOU\'VE BEEN QUIET LATELY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF011F54),
                          fontSize: 32,
                          fontFamily: 'Wosker',
                          fontWeight: FontWeight.w400,
                          height: 0.80,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: 258,
                        child: Text(
                          'Fuzzy misses you 💜 Let\'s ease back in, no pressure.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.workSans(
                            color: const Color(0xFF4C586E),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(flex: 4),

                    // Swipe button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _SwipeButton(),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Cross (Close) Button - Top Left
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    Assets.images.cross.path,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GreenBlob extends StatelessWidget {
  final double size;
  const _GreenBlob({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFF7BC67E),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _FuzzyCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(70, 80), painter: _FuzzyPainter());
  }
}

class _FuzzyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFF97316);

    // Body
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.68),
        width: size.width * 0.72,
        height: size.height * 0.55,
      ),
      paint,
    );

    // Head
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.32),
      size.width * 0.28,
      paint,
    );

    // Left arm
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.25, size.height * 0.6),
        width: size.width * 0.28,
        height: size.height * 0.32,
      ),
      paint,
    );

    // Right arm
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.75, size.height * 0.6),
        width: size.width * 0.28,
        height: size.height * 0.32,
      ),
      paint,
    );

    // Eyes
    final eyePaint = Paint()
      ..color = const Color(0xFF7C2D12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    // Left eye
    final leftEyePath = Path();
    leftEyePath.moveTo(size.width * 0.39, size.height * 0.30);
    leftEyePath.quadraticBezierTo(
      size.width * 0.43,
      size.height * 0.26,
      size.width * 0.47,
      size.height * 0.30,
    );
    canvas.drawPath(leftEyePath, eyePaint);

    // Right eye
    final rightEyePath = Path();
    rightEyePath.moveTo(size.width * 0.53, size.height * 0.30);
    rightEyePath.quadraticBezierTo(
      size.width * 0.57,
      size.height * 0.26,
      size.width * 0.61,
      size.height * 0.30,
    );
    canvas.drawPath(rightEyePath, eyePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SwipeButton extends StatefulWidget {
  @override
  State<_SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<_SwipeButton> {
  double _dragOffset = 0;
  final double _maxDrag = 220;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      padding: const EdgeInsets.only(top: 8, left: 8, right: 40, bottom: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFF4542EB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        shadows: [
          BoxShadow(
            color: Color(0x070A0C12),
            blurRadius: 6,
            offset: Offset(0, 4),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x140A0C12),
            blurRadius: 16,
            offset: Offset(0, 12),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Image.asset(
            Assets.images.left.path,
            width: 90,
            height: 90,
            fit: BoxFit.contain,
          ),
          Text(
            'Swipe to start',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFEEEEEE),
              fontSize: 24,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w900,
              height: 0.80,
            ),
          ),
        ],
      ),
    );
  }
}
