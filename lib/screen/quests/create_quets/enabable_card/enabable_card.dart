import 'package:flutter/material.dart';

class EnableCallCard extends StatefulWidget {
  final double scale;

  const EnableCallCard({Key? key, this.scale = 1.0}) : super(key: key);

  @override
  _EnableCallCardState createState() => _EnableCallCardState();
}

class _EnableCallCardState extends State<EnableCallCard> {
  bool isCallEnabled = false;

  @override
  Widget build(BuildContext context) {
    double s = widget.scale;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12 * s),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * s),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Icon(Icons.phone_in_talk, color: Colors.blue[900]),
              SizedBox(width: 8 * s),
              Text(
                'ENABLE CALL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10 * s),
          // Description + switch
          Row(
            children: [
              Expanded(
                child: Text(
                  'A real-time 10-min support call will help you stay on track.',
                  style: TextStyle(
                    fontSize: 12 * s,
                    color: Colors.blueGrey[700],
                  ),
                ),
              ),
              Switch(
                value: isCallEnabled,
                onChanged: (value) {
                  setState(() {
                    isCallEnabled = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
