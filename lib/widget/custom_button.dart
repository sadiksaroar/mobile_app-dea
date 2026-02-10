import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onTap;
  final String buttonText;
  final String? iconPath;
  final TextStyle? textStyle;
  final List<Color>? gradientColors;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomNextButton({
    super.key,
    required this.isEnabled,
    this.onTap,
    this.buttonText = 'NEXT',
    this.iconPath,
    this.textStyle,
    this.gradientColors,
    this.height = 100,
    this.borderRadius = 60,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    final defaultGradientColors =
        gradientColors ?? [const Color(0xFFFF9A3D), const Color(0xFFFF7A1A)];

    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: isEnabled ? onTap : null,
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.5,
          child: Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: defaultGradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: isEnabled
                  ? [
                      BoxShadow(
                        color: Colors.orange.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : [],
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    buttonText,
                    style:
                        textStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (iconPath != null)
                  Positioned(
                    right: 8,
                    top: 8,
                    bottom: 8,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A40),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(iconPath!, width: 60, height: 60),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Usage Example:
// CustomNextButton(
//   isEnabled: _canProceed(),
//   onTap: () => context.push("/popupSpeking"),
//   buttonText: 'NEXT',
//   iconPath: Assets.svgIcons.startLetsGo.path,
//   textStyle: AppsTextStyles.letsStartNext,
// )
