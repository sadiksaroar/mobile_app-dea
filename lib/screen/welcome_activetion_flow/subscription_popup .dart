// import 'package:flutter/material.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';

// class SubscriptionPage extends StatelessWidget {
//   const SubscriptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: const DecorationImage(
//           image: AssetImage("assets/svg_images/Subscription Popup.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Close button
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),

//                   // Logo
//                   Center(
//                     child: Image.asset(
//                       // Assets.svgImages.popupro
//                       "assets/svg_images/popup_pro_icon.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Title
//                   const Center(
//                     child: Text(
//                       'START YOUR\nFREE NOWLII\nPRO WEEK',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1A237E),
//                         height: 1.2,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   // Subtitle
//                   const Center(
//                     child: Text(
//                       'Enjoy 30 days of full access. Your journey\nto focus and consistency begins today.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 14, color: Colors.black54),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   // Yearly Plan
//                   _buildPlanCard(
//                     title: 'Yearly',
//                     price: '\$25.99',
//                     subtitle: '7 days free\nthen \$19.99 / year',
//                     badge: 'save 25%',
//                     isSelected: true,
//                   ),

//                   const SizedBox(height: 15),

//                   // Monthly Plan
//                   _buildPlanCard(
//                     title: 'Monthly',
//                     price: '',
//                     subtitle: '7 days free\nthen \$19.99 / mo',
//                     badge: null,
//                     isSelected: false,
//                   ),

//                   const SizedBox(height: 30),

//                   // Features List
//                   const Text(
//                     'You\'ll get full access to',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1A237E),
//                     ),
//                   ),

//                   const SizedBox(height: 15),

//                   _buildFeatureItem(
//                     icon: Icons.mic,
//                     iconColor: const Color(0xFF8BC34A),
//                     title: 'Focus sessions',
//                   ),

//                   _buildFeatureItem(
//                     icon: Icons.emoji_emotions,
//                     iconColor: const Color(0xFF5C6BC0),
//                     title: 'Daily talks with Fuzzy',
//                   ),

//                   _buildFeatureItem(
//                     icon: Icons.insights,
//                     iconColor: const Color(0xFF64B5F6),
//                     title: 'Progress insights',
//                   ),

//                   const SizedBox(height: 30),

//                   // How it works section
//                   const Text(
//                     'How it works?',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1A237E),
//                     ),
//                   ),

//                   const SizedBox(height: 15),

//                   _buildTimelineItem(
//                     day: 'Now',
//                     description:
//                         'Get full access to all features. No payment required during free trial.',
//                     color: Colors.orange,
//                   ),

//                   _buildTimelineItem(
//                     day: 'Day 5',
//                     description: 'Get reminder about the free trial ending.',
//                     color: const Color(0xFF5C6BC0),
//                   ),

//                   _buildTimelineItem(
//                     day: 'Day 6',
//                     description:
//                         'We\'ll remind you to continue with Pro access if you\'d like.',
//                     color: const Color(0xFF8BC34A),
//                   ),

//                   const SizedBox(height: 30),

//                   // Start Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 60,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Start trial logic
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF5C6BC0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                       child: const Text(
//                         'Let\'s begin 7 days free',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   const Center(
//                     child: Text(
//                       'No credit card required. Cancel anytime.',
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPlanCard({
//     required String title,
//     required String price,
//     required String subtitle,
//     String? badge,
//     required bool isSelected,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.white : Colors.grey[100],
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: isSelected ? const Color(0xFF5C6BC0) : Colors.transparent,
//           width: 2,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1A237E),
//                     ),
//                   ),
//                   if (badge != null) ...[
//                     const SizedBox(width: 10),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.orange[100],
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Text(
//                         badge,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.orange,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 subtitle,
//                 style: const TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//             ],
//           ),
//           if (price.isNotEmpty)
//             Text(
//               price,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1A237E),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureItem({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: iconColor.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: iconColor, size: 24),
//           ),
//           const SizedBox(width: 15),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16, color: Colors.black87),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimelineItem({
//     required String day,
//     required String description,
//     required Color color,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 12,
//             height: 12,
//             margin: const EdgeInsets.only(top: 4),
//             decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   day,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1A237E),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   description,
//                   style: const TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/svg_images/Subscription Popup.png"),
          fit: BoxFit.none,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // <-- IMPORTANT FIX
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // Logo
                  Center(
                    child: Image.asset(
                      "assets/svg_images/popup_pro_icon.png",
                      width: 130,
                      height: 130,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Title
                  Center(
                    child: Text(
                      'START YOUR\nFREE NOWLII\nPRO WEEK',
                      textAlign: TextAlign.center,
                      style: AppsTextStyles.extraBold32Centered,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Subtitle
                  Center(
                    child: Text(
                      'Enjoy 30 days of full access. Your journey\nto focus and consistency begins today.',
                      textAlign: TextAlign.center,
                      style: AppsTextStyles.workSansRegularF16,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Yearly Plan
                  _buildPlanCard(
                    title: 'Yearly',
                    price: '\$25.99',
                    subtitle: '7 days free\nthen \$19.99 / year',
                    badge: 'save 25%',
                    isSelected: true,
                  ),

                  const SizedBox(height: 15),

                  // Monthly Plan
                  _buildPlanCard(
                    title: 'Monthly',
                    price: '',
                    subtitle: '7 days free\nthen \$19.99 / mo',
                    badge: null,
                    isSelected: false,
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'You\'ll get full access to',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),

                  const SizedBox(height: 15),

                  _buildFeatureItem(
                    icon: Icons.mic,
                    iconColor: Color(0xFF8BC34A),
                    title: 'Focus sessions',
                  ),

                  _buildFeatureItem(
                    icon: Icons.emoji_emotions,
                    iconColor: Color(0xFF5C6BC0),
                    title: 'Daily talks with Fuzzy',
                  ),

                  _buildFeatureItem(
                    icon: Icons.insights,
                    iconColor: Color(0xFF64B5F6),
                    title: 'Progress insights',
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'How it works?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),

                  const SizedBox(height: 15),

                  _buildTimelineItem(
                    day: 'Now',
                    description:
                        'Get full access to all features. No payment required during free trial.',
                    color: Colors.orange,
                  ),

                  _buildTimelineItem(
                    day: 'Day 5',
                    description: 'Get reminder about the free trial ending.',
                    color: Color(0xFF5C6BC0),
                  ),

                  _buildTimelineItem(
                    day: 'Day 6',
                    description:
                        'We\'ll remind you to continue with Pro access if you\'d like.',
                    color: Color(0xFF8BC34A),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5C6BC0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Let\'s begin 7 days free',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      'No credit card required. Cancel anytime.',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String subtitle,
    String? badge,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? Color(0xFF5C6BC0) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  if (badge != null) ...[
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
          if (price.isNotEmpty)
            Text(
              price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String day,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
