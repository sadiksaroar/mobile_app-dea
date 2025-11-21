// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mobile_app_dea/screen/settings/language/languegs_selector_screen.dart';
// import 'package:mobile_app_dea/screen/settings/notiofication_scren/notification_screen.dart';
// import 'package:mobile_app_dea/screen/settings/rate_nowli/rate_nowli.dart';

// // Separate Stateless Widget for Language Selector

// // Updated Settings Screen with cleaner code
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _soundsEnabled = true;
//   String _selectedLanguage = 'English';

//   // Simple method to show language selector
//   void _showLanguageSelector() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) =>
//           LanguageSelector(currentLanguage: _selectedLanguage),
//     ).then((value) {
//       if (value != null) {
//         setState(() => _selectedLanguage = value);
//       }
//     });
//   }

//   static void show(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => const RatingPopup(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF4C3EDD),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(),
//             const SizedBox(height: 16),
//             Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//                 child: ListView(
//                   padding: const EdgeInsets.all(16),
//                   children: [
//                     _buildSettingsItem(
//                       icon: Icons.workspace_premium,
//                       iconColor: const Color(0xFF4CAF50),
//                       title: 'Nowtli Pro',
//                       onTap: () => _navigateTo('Nowtli Pro'),
//                     ),
//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.notifications,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'Notifications',
//                       onTap: () {
//                         // context.go("/notification_screen");
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const NotificationsScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.auto_awesome,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'AI Personalization',
//                       onTap: () => _navigateTo('AI Personalization'),
//                     ),
//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.language,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'Language',
//                       onTap: _showLanguageSelector,
//                     ),

//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.volume_up,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'Sounds',
//                       trailing: Switch(
//                         value: _soundsEnabled,
//                         onChanged: (value) {
//                           setState(() {
//                             _soundsEnabled = value;
//                           });
//                         },
//                         activeColor: const Color(0xFF4C3EDD),
//                       ),
//                       onTap: null,
//                     ),
//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.lock,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'Privacy & Data',
//                       onTap: () => _navigateTo('Privacy & Data'),
//                     ),
//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.help,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'Help',
//                       onTap: () => _navigateTo('Help'),
//                     ),
//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.star,
//                       iconColor: const Color(0xFF4C3EDD),
//                       title: 'Rate Nowtli',
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           backgroundColor: Colors.transparent,
//                           builder: (_) => const RatingPopup(),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 12),
//                     _buildSettingsItem(
//                       icon: Icons.logout,
//                       iconColor: const Color(0xFFE53935),
//                       title: 'Log out',
//                       onTap: _handleLogout,
//                       titleColor: const Color(0xFFE53935),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           const SizedBox(width: 8),
//           const Text(
//             'SETTINGS',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.2,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsItem({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//     Widget? trailing,
//     VoidCallback? onTap,
//     Color? titleColor,
//   }) {
//     return Material(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade200),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: iconColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Icon(icon, color: iconColor, size: 20),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: titleColor ?? const Color(0xFF1A1A1A),
//                   ),
//                 ),
//               ),
//               trailing ??
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.grey.shade400,
//                     size: 16,
//                   ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _navigateTo(String destination) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text('Navigate to $destination')));
//   }

//   void _handleLogout() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Log out'),
//         content: const Text('Are you sure you want to log out?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Implement logout logic
//             },
//             child: const Text('Log out'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_app_dea/screen/settings/api_personalization_screen/ai_personalization_screen.dart';
import 'package:mobile_app_dea/screen/settings/language/languegs_selector_screen.dart';
import 'package:mobile_app_dea/screen/settings/notiofication_scren/notification_screen.dart';
import 'package:mobile_app_dea/screen/settings/nowli_primum/nowli_primum.dart';
import 'package:mobile_app_dea/screen/settings/privacy_data/privacy_data_screen.dart';
import 'package:mobile_app_dea/screen/settings/rate_nowli/rate_nowli.dart';

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
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSettingsItem(
                    icon: Icons.workspace_premium,
                    iconColor: const Color(0xFF4CAF50),
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
                    icon: Icons.notifications,
                    iconColor: const Color(0xFF4C3EDD),
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
                    icon: Icons.auto_awesome,
                    iconColor: const Color(0xFF4C3EDD),
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
                    icon: Icons.language,
                    iconColor: const Color(0xFF4C3EDD),
                    title: 'Language',
                    onTap: _showLanguageSelector,
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    icon: Icons.volume_up,
                    iconColor: const Color(0xFF4C3EDD),
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
                    icon: Icons.lock,
                    iconColor: const Color(0xFF4C3EDD),
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
                    icon: Icons.help,
                    iconColor: const Color(0xFF4C3EDD),
                    title: 'Help',
                    onTap: () => _navigateTo('Help'),
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsItem(
                    icon: Icons.star,
                    iconColor: const Color(0xFF4C3EDD),
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
                    icon: Icons.logout,
                    iconColor: const Color(0xFFE53935),
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
          const Text(
            'SETTINGS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required Color iconColor,
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
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: titleColor ?? const Color(0xFF1A1A1A),
                  ),
                ),
              ),
              trailing ??
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade400,
                    size: 16,
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
