import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/svg_images/upscalemedia-transformed.png',
                  ),

                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    SizedBox(height: 20),
                    _buildHeader(),
                    const SizedBox(height: 24),

                    // Progress Card
                    _buildProgressCard(),
                    const SizedBox(height: 24),

                    // Date and Add Plan
                    _buildDateSection(),
                    const SizedBox(height: 24),

                    // Today's Plan Header
                    _buildTodaysPlanHeader(),
                    const SizedBox(height: 16),

                    // Task List
                    _buildTaskList(),
                    const SizedBox(height: 24),

                    // Swipe to Talk Button
                    _buildSwipeButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFD4E3FF),
          child: Icon(Icons.person_outline, color: Color(0xFF5B7EFF)),
        ),
        const Text(
          'HI JULIE!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1F36),
            letterSpacing: 1,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: Color(0xFF5B7EFF),
                size: 20,
              ),
              SizedBox(width: 4),
              Text(
                '1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1F36),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD4E3FF), Color(0xFFE8F0FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ready to make\ntoday count?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1F36),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tiny wins make big shifts.',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Todays progress',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1F36),
                  ),
                ),
                const SizedBox(height: 8),

                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFC3DBFF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      // Gradient progress
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth * 0.15, // 20% progress
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                // begin: Alignment.centerLeft,
                                // end: Alignment.centerRight,
                                begin: Alignment(0.00, 1.20),
                                end: Alignment(1.00, 0.50),
                                colors: [Color(0xFFDFEFFF), Color(0xFF4542EB)],
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF5B7EFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text('🐻', style: TextStyle(fontSize: 40)),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF5B7EFF), width: 2),
          ),
          child: const Column(
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1A1F36),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '14',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1F36),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF5B7EFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            children: [
              Icon(Icons.add, color: Colors.white, size: 20),
              SizedBox(height: 4),
              Text(
                'Plan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTodaysPlanHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Todays plan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1F36),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Color(0xFF5B7EFF)),
          label: const Text(
            'Add quest',
            style: TextStyle(
              color: Color(0xFF5B7EFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Color(0xFF5B7EFF)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    final tasks = [
      TaskItem('To wake up ☀️', '10:00', false),
      TaskItem('To walk 🚶', '10:30', false),
      TaskItem('To study 📚', '12:00', false),
      TaskItem('To train 💪', '16:00', false),
      TaskItem('To Sleep', '22:00', false, isSpecial: true),
    ];

    return Column(children: tasks.map((task) => _buildTaskItem(task)).toList());
  }

  Widget _buildTaskItem(TaskItem task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: task.isSpecial ? const Color(0xFF5B7EFF) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: task.isSpecial ? Colors.white : const Color(0xFF5B7EFF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: task.isCompleted
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: task.isSpecial
                        ? Colors.white
                        : const Color(0xFF5B7EFF),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                if (task.isSpecial)
                  const Text('🌙 ', style: TextStyle(fontSize: 16)),
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: task.isSpecial
                        ? Colors.white
                        : const Color(0xFF1A1F36),
                  ),
                ),
              ],
            ),
          ),
          Text(
            task.time,
            style: TextStyle(
              fontSize: 14,
              color: task.isSpecial
                  ? Colors.white.withOpacity(0.8)
                  : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.auto_awesome, color: Colors.white),
          SizedBox(width: 12),
          Text(
            'Swipe to talk to Fuzzy',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskItem {
  final String title;
  final String time;
  final bool isCompleted;
  final bool isSpecial;

  TaskItem(this.title, this.time, this.isCompleted, {this.isSpecial = false});
}
