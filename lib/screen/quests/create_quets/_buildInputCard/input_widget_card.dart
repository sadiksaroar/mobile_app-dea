import 'package:flutter/material.dart';

class InputCardWidget extends StatelessWidget {
  final double scale;
  final TextEditingController? controller;

  const InputCardWidget({Key? key, this.scale = 1.0, this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: EdgeInsets.all(14 * scale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8 * scale,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Write down your quest...',
          hintStyle: TextStyle(
            fontSize: 16 * scale,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
