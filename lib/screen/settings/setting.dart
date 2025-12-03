import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/screen/settings/api_personalization_screen/ai_personalization_screen.dart';
import 'package:mobile_app_dea/screen/settings/language/languegs_selector_screen.dart';
import 'package:mobile_app_dea/screen/settings/notiofication_scren/notification_screen.dart';
import 'package:mobile_app_dea/screen/settings/nowli_primum/nowli_primum.dart';
import 'package:mobile_app_dea/screen/settings/privacy_data/privacy_data_screen.dart';
import 'package:mobile_app_dea/screen/settings/rate_nowli/rate_nowli.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _soundsEnabled = true;
  String _selectedLanguage = 'English';

  void _showLanguageSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          LanguageSelector(currentLanguage: _selectedLanguage),
    ).then((value) {
      if (value != null) {
        setState(() => _selectedLanguage = value);
      }
    });
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const RatingPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C3EDD),
      body: Column(
        children: [
          SafeArea(bottom: false, child: _buildHeader()),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFEF8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.nowliPro.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Nowtli Pro',
                    onTap: () => {context.push('/subscriptionPage')},
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.notifications.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Notifications',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.aIPersonalization.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'AI Personalization',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AIPersonalizationScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.language.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Language',
                    onTap: _showLanguageSelector,
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.sounds.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Sounds',
                    trailing: Switch(
                      value: _soundsEnabled,
                      onChanged: (value) {
                        setState(() {
                          _soundsEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF4C3EDD),
                    ),
                    onTap: null,
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.privacyData.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Privacy & Data',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyDataScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.help.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Help',
                    onTap: () => _navigateTo('Help'),
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.rateNowliw.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Rate Nowtli',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const RatingPopup(),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    iconWidget: Image.asset(
                      Assets.svgIcons.logOut.path,
                      width: 40,
                      height: 40,
                    ),
                    title: 'Log out',
                    onTap: _handleLogout,
                    titleColor: const Color(0xFFE53935),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            // color: Colors.black,
            icon: Image.asset(
              Assets.svgIcons.settingsBackIcon.path,
              width: 32,
              height: 32,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          Text('SETTINGS', style: AppsTextStyles.kSettingsTitleStyle),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    IconData? icon,
    Widget? iconWidget, // <-- New optional widget
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? titleColor,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),

                child:
                    iconWidget ??
                    (icon != null ? Icon(icon, size: 20) : const SizedBox()),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(title, style: AppsTextStyles.textDefaultStyle),
              ),
              trailing ??
                  Icon(
                    Icons.arrow_forward_ios,
                    color: const Color(0xFF1A1A1A),
                    size: 20,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(String destination) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Navigate to $destination')));
  }

  void _handleLogout() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFEF8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E5FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xFF4C3EDD),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                const Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF666666),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),

                // Buttons row
                Row(
                  children: [
                    // Cancel button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(
                            color: Color(0xFF4C3EDD),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFF4C3EDD),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Log out button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _performLogout();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: const Color(0xFFE53935),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _performLogout() {}
}
