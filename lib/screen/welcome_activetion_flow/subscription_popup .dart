import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/screen/remiender_notification/choose_your_mood/chooise_your_mood.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/utlis/color_palette/color_palette.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            // width: double.infinity,
            width: MediaQuery.of(context).size.width, // Full screen width
            height: MediaQuery.of(context).size.height, // Full screen height
            // height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.svgImages.subscriptionPopupPng.image().image,
                fit: BoxFit.cover,
              ),
            ),

            // Main content
            child: SafeArea(
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
                          // icon: const Icon(Icons.close),
                          icon: Assets.svgIcons.proCrossIcon.svg(
                            width: 38,
                            height: 38,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      // Logo
                      Center(
                        child: Image.asset(
                          "assets/svg_images/popup_pro_icon.png",
                          width: 240,
                          height: 240,
                        ),
                      ),

                      // Title
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'START YOUR ',
                                style: AppsTextStyles.SaimTitle,
                              ),
                              TextSpan(
                                text: 'FREE NOWLII PRO WEEK',
                                style: AppsTextStyles.googleContinueButton52,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      Center(
                        child: Text(
                          'Enjoy 30 days of full access. Your journey\nto focus and consistency begins today.',
                          textAlign: TextAlign.center,
                          style: AppsTextStyles.PasswordUpdateSub,
                        ),
                      ),
                      const SizedBox(height: 30),

                      Container(
                        width: 330,
                        height: 140,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xffB8FFAB),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xff4556F6),
                            width: 3,
                          ),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            /// Orange Badge
                            Positioned(
                              top: -38,
                              right: -10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFF8A00),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text(
                                  "save 26%",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            /// Main Row Content
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// LEFT SIDE
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Yearly",
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0A1F44),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "\$25.99",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff0A1F44),
                                      ),
                                    ),
                                  ],
                                ),

                                const Spacer(),

                                /// RIGHT SIDE
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "7 days free",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff6C4FF6),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text.rich(
                                      TextSpan(
                                        text: "then ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black87,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "\$19.99",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " / mo",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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

                      // Features List
                      Container(
                        decoration: BoxDecoration(
                          color: AppColorsApps.softCream,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColorsApps.darkBlue,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                iconColor: const Color(0xFF8BC34A),
                                title: 'Focus sessions',
                              ),
                              _buildFeatureItem(
                                icon: Icons.emoji_emotions,
                                iconColor: const Color(0xFF5C6BC0),
                                title: 'Daily talks with Fuzzy',
                              ),
                              _buildFeatureItem(
                                icon: Icons.insights,
                                iconColor: const Color(0xFF64B5F6),
                                title: 'Progress insights',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // How it works section
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
                        description:
                            'Get reminder about the free trial ending.',
                        color: const Color(0xFF5C6BC0),
                      ),
                      _buildTimelineItem(
                        day: 'Day 6',
                        description:
                            'We\'ll remind you to continue with Pro access if you\'d like.',
                        color: const Color(0xFF8BC34A),
                      ),
                      const SizedBox(height: 30),

                      // Start Button
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            // Start trial logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3F3CD6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Let\'s begin 7 days free',
                            style: AppsTextStyles.workSansBodyEntryScreen,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Center(
                        child: Text(
                          'No credit card required. Cancel anytime.',
                          style: AppsTextStyles.workSansSemiBold16signIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
        // color: isSelected ? Colors.white : Colors.grey[100],
        color: AppColorsApps.softCream,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? const Color(0xFF5C6BC0) : Colors.transparent,
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
      child: Container(
        decoration: BoxDecoration(
          color: AppColorsApps.softCream,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: color, width: 2),
        ),
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
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFFFF0),
      body: Center(
        child: Container(
          width: 330,
          height: 140,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xffB8FFAB),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xff4556F6), width: 3),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              /// Orange Badge
              Positioned(
                top: -38,
                right: -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF8A00),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "save 26%",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              /// Main Row Content
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// LEFT SIDE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Yearly",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0A1F44),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\$25.99",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0A1F44),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// RIGHT SIDE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "7 days free",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6C4FF6),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          text: "then ",
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                          children: [
                            TextSpan(
                              text: "\$19.99",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " / mo",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/