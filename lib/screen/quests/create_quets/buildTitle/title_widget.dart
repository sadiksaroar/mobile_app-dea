import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/create_qutes.dart';

class TitleWidget extends StatelessWidget {
  final double scale;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMicPressed;
  const TitleWidget({
    Key? key,
    this.scale = 1.0,
    this.onBackPressed,
    this.onMicPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onBackPressed,
          child: CircleAvatar(
            radius: 18 * scale,

            child: Image.asset(
              Assets.svgIcons.settingsBackIcon.path,
              height: 32,
              width: 32,
            ),
          ),
        ),
        SizedBox(width: 12 * scale),
        Column(
          children: [
            Text('CREATE\nQUEST', style: AppTextStylesQutes.alfaSlabOneTitle),
            SizedBox(height: 6 * scale),
            Text(
              'Small steps big progress',
              style: AppTextStylesQutes.workSansRegular16,
            ),
          ],
        ),
        SizedBox(width: 20 * scale),
        GestureDetector(
          onTap: onMicPressed,
          child: Container(
            width: 44 * scale,
            height: 44 * scale,
            decoration: BoxDecoration(
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
              child: Image.asset(
                Assets.svgIcons.voice.path,
                width: 60 * scale,
                height: 60 * scale,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
