import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final double scale;

  const TitleWidget({Key? key, this.scale = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CREATE\nQUEST',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30 * scale,
            height: 0.95,
            color: const Color(0xFF173A7A),
          ),
        ),
        SizedBox(height: 6 * scale),
        Text(
          'Small steps big progress',
          style: TextStyle(fontSize: 12 * scale, color: Colors.blueGrey[800]),
        ),
      ],
    );
  }
}
