import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with scroll
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/svg_images/Subscription Popup.png'),
                  fit: BoxFit.values.first,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  // Close button
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: IconButton(
                        // icon: Icon(Icons.close, color: Colors.grey[700]),
                        icon: SvgPicture.asset(
                          Assets.svgIcons.proCrossIcon.path,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  // Logo
                  // Image.asset('assets/images/nowlii_logo.png', height: 80),
                  SvgPicture.asset(
                    Assets.svgImages.proIcon.path,
                    width: 122, // optional
                    height: 122, // optional
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  // Title
                  Text(
                    'START YOUR',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1B3A6B),
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'FREE NOWLII',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1B3A6B),
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'PRO WEEK',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4169E1),
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 12),
                  // Subtitle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Enjoy 30 days of full access — your journey to focus and consistency begins today.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Subscription options
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // Yearly option
                        _buildSubscriptionCard(
                          title: 'Yearly',
                          price: 'save 26%',
                          trialText: '7 days free',
                          thenText: 'then \$19.99 / mo',

                          isSelected: true,
                        ),

                        SizedBox(height: 12),
                        // Monthly option
                        _buildSubscriptionCard(
                          title: 'Monthly',
                          trialText: '7 days free',
                          thenText: 'then \$19.99 / mo',
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  // Features section
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You\'ll get full access to',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B3A6B),
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildFeatureItem(
                          icon: Icons.mic,
                          text: 'Focus sessions',
                          color: Color(0xFF4CAF50),
                        ),
                        SizedBox(height: 12),
                        _buildFeatureItem(
                          icon: Icons.chat_bubble,
                          text: 'Daily talks with Fuzzy',
                          color: Color(0xFFFFB74D),
                        ),
                        SizedBox(height: 12),
                        _buildFeatureItem(
                          icon: Icons.auto_graph,
                          text: 'Progress insights',
                          color: Color(0xFF4169E1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  // How it works section
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How it works?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B3A6B),
                          ),
                        ),
                        SizedBox(height: 16),

                        TimelineCard(
                          color: Colors.orange,
                          title: 'Now',
                          description:
                              'Get full access to all features. No card required during trial.',
                        ),
                        SizedBox(height: 12),
                        TimelineCard(
                          color: Colors.blue,
                          title: 'Day 5',
                          description:
                              'Get reminder about the free trial ending.',
                        ),
                        SizedBox(height: 12),
                        TimelineCard(
                          color: Colors.green,
                          title: 'Day 6',
                          description:
                              'We’ll remind you to continue with Pro access if you’d like.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  // CTA Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4169E1),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(double.infinity, 56),
                      ),
                      child: Text(
                        'Let\'s begin 7 days free',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No credit card required. Cancel anytime.',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    String? price,
    required String trialText,
    required String thenText,
    String? badge,
    required bool isSelected,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFE8F5E9) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? Color(0xFF4CAF50) : Colors.grey[300]!,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title only (price is now removed from here)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B3A6B),
                    ),
                  ),
                ],
              ),

              // Right Side Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (badge != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFB74D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  SizedBox(height: 4),
                  Text(
                    trialText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B3A6B),
                    ),
                  ),
                  Text(
                    thenText,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),

        // 🔥 Price positioned on the border — top-left corner
        if (price != null)
          Positioned(
            top: -12,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Text(
                price!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3A6B),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /*
 
*/
  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        SizedBox(width: 12),
        Text(text, style: TextStyle(fontSize: 16, color: Color(0xFF1B3A6B))),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String label,
    required String description,
    required Color color,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            if (!isLast) Container(color: Colors.grey[300]),
          ],
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1B3A6B),
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineCard extends StatelessWidget {
  final Color color;
  final String title;
  final String description;

  const TimelineCard({
    super.key,
    required this.color,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // card background
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Colored circle
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 12),
          // Title + description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
