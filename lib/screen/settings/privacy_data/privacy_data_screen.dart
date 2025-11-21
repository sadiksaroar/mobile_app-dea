// import 'package:flutter/material.dart';

// class PrivacyDataScreen extends StatelessWidget {
//   const PrivacyDataScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF4F46E5),
//       body: Column(
//         children: [
//           // Header
//           SafeArea(
//             bottom: false,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     padding: EdgeInsets.zero,
//                     constraints: const BoxConstraints(),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'PRIVACY & DATA',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),

//           // White card container
//           Flexible(
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: ListView(
//                 children: [
//                   _buildMenuItem(
//                     icon: Icons.info,
//                     title: 'Privacy Policy',
//                     onTap: () {
//                       // Navigate to Privacy Policy
//                     },
//                   ),
//                   const SizedBox(height: 12),
//                   _buildMenuItem(
//                     icon: Icons.info,
//                     title: 'Terms of Use',
//                     onTap: () {
//                       // Navigate to Terms of Use
//                     },
//                   ),
//                   const SizedBox(height: 12),
//                   _buildMenuItem(
//                     icon: Icons.close,
//                     title: 'Delete My Account',
//                     onTap: () {
//                       _showDeleteAccountDialog(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuItem({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF8F9FA),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Row(
//           children: [
//             // Icon
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE8E9F3),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Icon(icon, color: const Color(0xFF1E3A8A), size: 22),
//             ),
//             const SizedBox(width: 16),

//             // Title
//             Expanded(
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF1E3A8A),
//                 ),
//               ),
//             ),

//             // Arrow
//             const Icon(
//               Icons.arrow_forward_ios,
//               color: Color(0xFF1E3A8A),
//               size: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showDeleteAccountDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text(
//           'Delete Account',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1E3A8A),
//           ),
//         ),
//         content: const Text(
//           'Are you sure you want to delete your account? This action cannot be undone.',
//           style: TextStyle(color: Color(0xFF6B7280)),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text(
//               'Cancel',
//               style: TextStyle(color: Color(0xFF6B7280)),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Handle account deletion
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFE53935),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: const Text('Delete', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_app_dea/screen/settings/privacy_data/delete_account_dialog/delete_account_dialog.dart';

class PrivacyDataScreen extends StatelessWidget {
  const PrivacyDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C3EDD),
      body: Column(
        children: [
          // Header
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'PRIVACY & DATA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // White card container
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView(
                children: [
                  _buildPrivacyItem(
                    context: context,
                    icon: Icons.info,
                    title: 'Privacy Policy',
                    onTap: () => _navigateToPolicy(context, 'Privacy Policy'),
                  ),
                  const SizedBox(height: 12),
                  _buildPrivacyItem(
                    context: context,
                    icon: Icons.info,
                    title: 'Terms of Use',
                    onTap: () => _navigateToPolicy(context, 'Terms of Use'),
                  ),
                  const SizedBox(height: 12),
                  _buildPrivacyItem(
                    context: context,
                    icon: Icons.close,
                    title: 'Delete My Account',
                    onTap: () => _showDeleteAccountDialog(context),
                    isDestructive: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Material(
      color: const Color(0xFFF8F9FA),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDestructive
                      ? const Color(0xFFFFE5E5)
                      : const Color(0xFFE8E9F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: isDestructive
                      ? const Color(0xFFE53935)
                      : const Color(0xFF1E3A8A),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),

              // Title
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isDestructive
                        ? const Color(0xFFE53935)
                        : const Color(0xFF1E3A8A),
                  ),
                ),
              ),

              // Arrow
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

  void _navigateToPolicy(BuildContext context, String policyType) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Opening $policyType')));
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const DeleteAccountDialog(),
    );
  }
}
