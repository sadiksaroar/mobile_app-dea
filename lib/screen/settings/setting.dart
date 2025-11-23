import 'package:flutter/material.dart';
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubscriptionScreen(
                          type: SubscriptionType.monthlyActive,
                        ),
                      ),
                    ),
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
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
      builder: (context) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement logout logic
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
