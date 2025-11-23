import 'package:flutter/material.dart';

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
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Today',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '22:00',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
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
