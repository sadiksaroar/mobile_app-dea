import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final double scale;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMicPressed;

  const HeaderWidget({
    Key? key,
    this.scale = 1.0,
    this.onBackPressed,
    this.onMicPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBackPressed,
          child: CircleAvatar(
            radius: 18 * scale,
            backgroundColor: Colors.white.withOpacity(0.85),
            child: Icon(
              Icons.arrow_back,
              color: Colors.blue[800],
              size: 22 * scale,
            ),
          ),
        ),
        GestureDetector(
          onTap: onMicPressed,
          child: Container(
            width: 44 * scale,
            height: 44 * scale,
            decoration: BoxDecoration(
              color: const Color(0xFF5C4AE2),
              borderRadius: BorderRadius.circular(10 * scale),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6 * scale,
                  offset: Offset(0, 3 * scale),
                ),
              ],
            ),
            child: Center(
              child: Icon(Icons.mic, color: Colors.white, size: 20 * scale),
            ),
          ),
        ),
      ],
    );
  }
}
