import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10, // Background
      child: SafeArea(
        child: Column(
          children: [
            // ---------------- CUSTOM APP BAR ----------------
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shuffle, size: 16, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Text(
                      'Shuffle',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------- BODY ----------------
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  ActivityCard(
                    title: 'To sleep',
                    description:
                        'Wind down, unplug, and prep your mind for rest.',
                    gradientColors: [Color(0xFF4A5FE8), Color(0xFF7B94F5)],
                    emoji: '🌙',
                    duration: '10 mins',
                    difficulty: 'Get sleepy',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To wake up',
                    description:
                        'Start fresh. No scrolling — just light, breath, and you.',
                    gradientColors: [Color(0xFFFFB347), Color(0xFFFFCC99)],
                    emoji: '☀️',
                    duration: '10 mins',
                    difficulty: 'Soft snaps',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To walk',
                    description:
                        'Move your body, clear your mind. Even for ten counts.',
                    gradientColors: [Color(0xFF90EE90), Color(0xFFB4F0B4)],
                    emoji: '🚶',
                    duration: '10 mins',
                    difficulty: 'Soft steps',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To study',
                    description:
                        'Focus mode: on. Zero reflection — just in-gear.',
                    gradientColors: [Color(0xFFE6E6FA), Color(0xFFF0E6FA)],
                    emoji: '📚',
                    duration: '10 mins',
                    difficulty: 'Soft steps',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To train',
                    description:
                        'Release stress, boost energy. Show up for yourself.',
                    gradientColors: [Color(0xFFFFF8DC), Color(0xFFFFE4B5)],
                    emoji: '💪',
                    duration: '10 mins',
                    difficulty: 'Soft steps',
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

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Color> gradientColors;
  final String emoji;
  final String duration;
  final String difficulty;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
    required this.gradientColors,
    required this.emoji,
    required this.duration,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppsTextStyles.regularResponsive(context),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          // Today Tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  Assets.svgIcons.calende.path,
                                  width: 16,
                                  height: 16,
                                  // color: Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Today',
                                  style: AppsTextStyles.extraBold16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Time Tag
                          // Time Tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              // Remove 'const' here
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  Assets.svgIcons.clock.path,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '22:00',
                                  style: AppsTextStyles.extraBold16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Add Button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 24),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.9),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 16),

            // Duration + Difficulty
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE5B4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5D4E37),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4F4DD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    difficulty,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D5F3F),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Emoji
            Text(emoji, style: const TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
















/*
import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10, // Background
      child: SafeArea(
        child: Column(
          children: [
            // ---------------- CUSTOM APP BAR ----------------
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shuffle, size: 16, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Text(
                      'Shuffle',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------- BODY ----------------
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  ActivityCard(
                    title: 'To sleep',
                    description:
                        'Wind down, unplug, and prep your mind for rest.',
                    backgroundImagePath: "assets/svg_icons/To sleep.png",
                    emojiImagePath: 'assets/images/sleep_emoji.png',
                    duration: '10 mins',
                    difficulty: 'Get sleepy',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To wake up',
                    description:
                        'Start fresh. No scrolling — just light, breath, and you.',
                    backgroundImagePath: 'assets/svg_icons/To wake up.png',
                    emojiImagePath: 'assets/images/wakeup_emoji.png',
                    duration: '10 mins',
                    difficulty: 'Soft snaps',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To walk',
                    description:
                        'Move your body, clear your mind. Even for ten counts.',
                    backgroundImagePath: 'assets/images/walk_bg.png',
                    emojiImagePath: 'assets/images/walk_emoji.png',
                    duration: '10 mins',
                    difficulty: 'Soft steps',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To study',
                    description:
                        'Focus mode: on. Zero reflection — just in-gear.',
                    backgroundImagePath: 'assets/svg_icons/To study.png',
                    emojiImagePath: 'assets/images/study_emoji.png',
                    duration: '10 mins',
                    difficulty: 'Soft steps',
                  ),
                  SizedBox(height: 16),
                  ActivityCard(
                    title: 'To train',
                    description:
                        'Release stress, boost energy. Show up for yourself.',
                    backgroundImagePath: 'assets/svg_icons/To train.png',
                    emojiImagePath: 'assets/images/train_emoji.png',
                    duration: '10 mins',
                    difficulty: 'Soft steps',
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

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImagePath;
  final String emojiImagePath;
  final String duration;
  final String difficulty;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundImagePath,
    required this.emojiImagePath,
    required this.duration,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // PNG Background Image
            Positioned.fill(
              child: Image.asset(backgroundImagePath, fit: BoxFit.cover),
            ),

            // Gradient Overlay (optional - for better text readability)

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppsTextStyles.regularResponsive(context),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                // Today Tag
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        Assets.svgIcons.calende.path,
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Today',
                                        style: AppsTextStyles.extraBold16,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),

                                // Time Tag
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(Assets.svgIcons.clock.path),
                                      Text(
                                        '22:00',
                                        style: AppsTextStyles.extraBold16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Add Button
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white30,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Duration + Difficulty
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE5B4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5D4E37),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4F4DD),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          difficulty,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D5F3F),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // PNG Emoji Image
                  Image.asset(emojiImagePath, width: 48, height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/