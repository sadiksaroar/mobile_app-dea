import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

class ShapeYourNowliiScreen extends StatefulWidget {
  const ShapeYourNowliiScreen({super.key});

  @override
  State<ShapeYourNowliiScreen> createState() => _ShapeYourNowliiScreenState();
}

class _ShapeYourNowliiScreenState extends State<ShapeYourNowliiScreen> {
  int selectedIndex = 0;

  final List<String> animations = [
    'assets/lottie_animations/A fitness cow.json',
    'assets/lottie_animations/Food loading.json',
    'assets/lottie_animations/Sandy Loading.json',
    'assets/lottie_animations/Watermelon Fixing.json',
    'assets/lottie_animations/Sandy Loading.json',
    'assets/lottie_animations/Watermelon Fixing.json',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF1), // light cream background

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: 5 / 6,
                  backgroundColor: Colors.grey[300],
                  color: const Color(0xFF4B9EFF),
                  minHeight: 6,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                // Skip action; adapt as needed
                Navigator.of(context).maybePop();
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "LET’S SHAPE YOUR NOWLII",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D1C2E),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Give it a form so we can face it, instead of chase it!",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // 6 Lottie items (Grid layout)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: List.generate(
                  animations.length,
                  (index) => buildLottieBox(
                    animations[index],
                    index: index,
                    isSelected: selectedIndex == index,
                    color: _backgroundForIndex(index),
                    onTap: () => setState(() => selectedIndex = index),
                  ),
                ),
              ),
            ),

            // Next button
            GestureDetector(
              onTap: () {
                // Example: navigate or save selection
                // Navigator.of(context).pushNamed('/next');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected #${selectedIndex + 1}')),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA34E),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _backgroundForIndex(int i) {
    switch (i) {
      case 0:
        return Colors.blue.shade50;
      case 1:
        return const Color(0xFFFFA34E);
      case 2:
        return Colors.green.shade100;
      case 3:
        return Colors.blue.shade100;
      case 4:
        return const Color(0xFF6654F1);
      case 5:
        return const Color(0xFF89D6C0);
      default:
        return Colors.white;
    }
  }

  Widget buildLottieBox(
    String path, {
    required int index,
    bool isSelected = false,
    Color? color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: Colors.blueAccent, width: 3)
              : null,
        ),
        child: Center(child: _safeLottie(path)),
      ),
    );
  }

  // Render Lottie with a simple fallback to avoid crashing when asset missing or invalid.
  Widget _safeLottie(String path) {
    return FutureBuilder<LottieComposition?>(
      future: _loadComposition(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            return Lottie(
              composition: snapshot.data!,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            );
          } else {
            return const Icon(Icons.broken_image, size: 48, color: Colors.grey);
          }
        } else {
          return const SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
      },
    );
  }

  // Helper to load Lottie composition; catches exceptions if asset missing/invalid.
  Future<LottieComposition?> _loadComposition(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      return await LottieComposition.fromByteData(byteData);
    } catch (_) {
      return null;
    }
  }
}

// ...existing code...
