import 'package:flutter/material.dart';

class AddSubtasksButton extends StatefulWidget {
  final double scale;

  const AddSubtasksButton({Key? key, this.scale = 1.0}) : super(key: key);

  @override
  _AddSubtasksButtonState createState() => _AddSubtasksButtonState();
}

class _AddSubtasksButtonState extends State<AddSubtasksButton> {
  bool showSubtaskGenerator = false;

  @override
  Widget build(BuildContext context) {
    double s = widget.scale;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE6F0FF),
        borderRadius: BorderRadius.circular(12 * s),
        border: Border.all(color: Colors.blue.shade100, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with icon and add button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24 * s, vertical: 8 * s),
            child: Row(
              children: [
                Icon(
                  Icons.format_list_bulleted,
                  color: Colors.blue[900],
                  size: 20 * s,
                ),
                SizedBox(width: 8 * s),
                Expanded(
                  child: Text(
                    'ADD SUBTASKS',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w700,
                      fontSize: 13 * s,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showSubtaskGenerator = !showSubtaskGenerator;
                    });
                  },
                  child: Container(
                    width: 32 * s,
                    height: 32 * s,
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(8 * s),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20 * s),
                  ),
                ),
              ],
            ),
          ),
          // Expandable subtask generator section
          if (showSubtaskGenerator) ...[
            SizedBox(height: 12 * s),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12 * s),
              child: GestureDetector(
                onTap: () {
                  // Handle generate subtasks
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14 * s),
                  decoration: BoxDecoration(
                    color: const Color(0xFF89B6F8),
                    borderRadius: BorderRadius.circular(12 * s),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 18 * s,
                      ),
                      SizedBox(width: 8 * s),
                      Text(
                        "Generate subtasks",
                        style: TextStyle(
                          fontSize: 15 * s,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12 * s),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12 * s),
              child: Container(
                padding: EdgeInsets.all(14 * s),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12 * s),
                  border: Border.all(color: Colors.blue.shade100, width: 1.5),
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Write subtask...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15 * s,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(fontSize: 15 * s, color: Colors.blue[900]),
                ),
              ),
            ),
            SizedBox(height: 12 * s),
          ],
        ],
      ),
    );
  }
}
