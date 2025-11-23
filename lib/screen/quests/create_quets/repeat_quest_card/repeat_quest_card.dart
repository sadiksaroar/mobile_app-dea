import 'package:flutter/material.dart';

class RepeatQuestCard extends StatefulWidget {
  final double scale;

  const RepeatQuestCard({Key? key, this.scale = 1.0}) : super(key: key);

  @override
  _RepeatQuestCardState createState() => _RepeatQuestCardState();
}

class _RepeatQuestCardState extends State<RepeatQuestCard> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    double s = widget.scale;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12 * s),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F0FF),
        borderRadius: BorderRadius.circular(12 * s),
      ),
      child: Row(
        children: [
          // Text description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REPEAT QUEST',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6 * s),
                Text(
                  'Turn this on to repeat the quest daily or weekly.',
                  style: TextStyle(
                    fontSize: 12 * s,
                    color: Colors.blueGrey[700],
                  ),
                ),
              ],
            ),
          ),
          // Switch
          Switch(
            value: _switchValue,
            onChanged: (bool newValue) {
              setState(() {
                _switchValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
