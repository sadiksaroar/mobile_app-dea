import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  void initState() {
    super.initState();
    // Ensure LanguageController is registered
    if (!Get.isRegistered<LanguageController>()) {
      Get.put(LanguageController());
    }
  }

  double _indicatorLeft(BuildContext context) =>
      MediaQuery.of(context).size.width / 4 * widget.currentIndex;

  // int _currentIndex = 0;

  // void _onNavTap(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });

  //   switch (index) {
  //     case 0:
  //       context.go(AppRoutespath.homePage);
  //       break;
  //     case 1:
  //       context.go(AppRoutespath.chatBoot);
  //       break;
  //     case 2:
  //       context.go(AppRoutespath.explor);
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFDFEFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(6, 0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          GetBuilder<LanguageController>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    icon: Assets.svgIcons.homeTab.path,
                    label: 'Home'.tr,
                    index: 0,
                    isSelected: widget.currentIndex == 0,
                  ),
                  _buildNavItem(
                    icon: Assets.svgIcons.magicWand.path,
                    label: 'Quests'.tr,
                    index: 1,
                    isSelected: widget.currentIndex == 1,
                  ),
                  _buildNavItem(
                    icon: Assets.svgIcons.fireTab.path,
                    label: 'Progress'.tr,
                    index: 3,
                    isSelected: widget.currentIndex == 3,
                  ),
                ],
              );
            },
          ),
          AnimatedPositioned(
            bottom: 0,
            left: _indicatorLeft(context),
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width / 4,
              color: Colors.blue, // Changed from white to blue for visibility
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String icon, // Changed from IconData to String for SVG path
    required String label,
    required int index,
    required bool isSelected,
  }) {
    final iconColor = isSelected ? Colors.blue : Colors.grey;
    final textColor = isSelected ? Colors.blue : Colors.grey;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(icon, color: iconColor, width: 24, height: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageController extends GetxController {
  void updateLanguage(Locale locale) {
    Get.updateLocale(locale);
    update();
  }
}
