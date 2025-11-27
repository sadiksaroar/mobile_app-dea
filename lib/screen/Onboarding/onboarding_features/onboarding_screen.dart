import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  String _selectedName = 'KNOTTY';
  String _selectedGender = '';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _completeOnboarding() {
    print('Name: $_selectedName, Gender: $_selectedGender');
    // TODO: Navigate to next screen
  }

  bool _canProceed() {
    if (_currentPage == 0) {
      return _selectedName.isNotEmpty;
    } else if (_currentPage == 1) {
      return _selectedGender.isNotEmpty;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5E6),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  NameSelectionPage(
                    selectedName: _selectedName,
                    onNameSelected: (name) {
                      setState(() {
                        _selectedName = name;
                      });
                    },
                  ),
                ],
              ),
            ),
            _buildNextButton(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (_currentPage > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: LinearProgressIndicator(
                  value: (_currentPage + 1) / 2,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF4169E1),
                  ),
                  minHeight: 4,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${_currentPage + 1}/2',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: _completeOnboarding,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    final isEnabled = _canProceed();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GestureDetector(
        onTap: () {
          context.push("/popupSpeking");
        },
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.5,
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9A3D), Color(0xFFFF7A1A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: isEnabled
                  ? [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : [],
            ),
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  bottom: 8,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A40),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameSelectionPage extends StatefulWidget {
  final String selectedName;
  final Function(String) onNameSelected;

  const NameSelectionPage({
    Key? key,
    required this.selectedName,
    required this.onNameSelected,
  }) : super(key: key);

  @override
  State<NameSelectionPage> createState() => _NameSelectionPageState();
}

class _NameSelectionPageState extends State<NameSelectionPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  bool _showTextField = false;
  int _currentAvatarIndex = 0;
  bool _isAnimating = true;
  bool _showNameDisplay = false;

  final List<AvatarData> avatars = [
    AvatarData(
      name: 'KNOTTY',
      color: const Color(0xFF6B4FBB),
      lottieAsset: 'assets/lottie_animations/A fitness cow.json',
    ),
    AvatarData(
      name: 'BLOOBY',
      color: const Color(0xFF4169E1),
      lottieAsset: 'assets/lottie_animations/Dancing llama.json',
    ),
    AvatarData(
      name: 'FIZZY',
      color: const Color(0xFFFF6B6B),
      lottieAsset: 'assets/lottie_animations/Easter Bunny Boy waving.json',
    ),
    AvatarData(
      name: 'BOUNCY',
      color: const Color(0xFF4ECDC4),
      lottieAsset: 'assets/lottie_animations/Food loading.json',
    ),
    AvatarData(
      name: 'ZIPPY',
      color: const Color(0xFFFFBE0B),
      lottieAsset: 'assets/lottie_animations/Sandy Loading.json',
    ),
    AvatarData(
      name: 'MELON',
      color: const Color(0xFFFF69B4),
      lottieAsset: 'assets/lottie_animations/Watermelon Fixing.json',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.elasticOut),
    );

    _startAutoRotation();
  }

  void _startAutoRotation() async {
    // Auto-rotate through avatars every 3 seconds
    for (int i = 0; i < avatars.length; i++) {
      if (!mounted || !_isAnimating) break;

      await Future.delayed(const Duration(seconds: 3));

      if (!mounted || !_isAnimating) break;

      setState(() {
        _currentAvatarIndex = (i + 1) % avatars.length;
      });
      _bounceController.forward(from: 0);
    }

    // After showing all avatars, show the name display
    if (mounted && _isAnimating) {
      setState(() {
        _isAnimating = false;
        _showNameDisplay = true;
      });
      widget.onNameSelected(avatars[_currentAvatarIndex].name);
    }
  }

  void _rotateAvatar() {
    setState(() {
      _currentAvatarIndex = (_currentAvatarIndex + 1) % avatars.length;
      _showTextField = false;
      _nameController.clear();
    });
    widget.onNameSelected(avatars[_currentAvatarIndex].name);
    _bounceController.forward(from: 0);
  }

  void _showCustomNameInput() {
    setState(() {
      _showTextField = true;
    });
  }

  void _onCustomNameChanged(String value) {
    if (value.trim().length >= 2 && value.trim().length <= 12) {
      widget.onNameSelected(value.trim());
      _bounceController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOW WOULD YOU LIKE TO\nCALL IT?',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Give your form a name.',
            style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 32),

          // Character with animation
          ScaleTransition(
            scale: _bounceAnimation,
            child: Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _showTextField
                    ? const Color(0xFF4169E1)
                    : avatars[_currentAvatarIndex].color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: CharacterWidget(
                  lottieAsset: _showTextField
                      ? avatars[0].lottieAsset
                      : avatars[_currentAvatarIndex].lottieAsset,
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Show loading indicator during animation
          if (_isAnimating) ...[
            Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF4169E1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Discovering your character...',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ]
          // Name display or input after animation
          else if (!_showTextField && _showNameDisplay) ...[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    avatars[_currentAvatarIndex].name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1E293B),
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: _rotateAvatar,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF1E293B),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.refresh,
                        size: 20,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: OutlinedButton.icon(
                onPressed: _showCustomNameInput,
                icon: const Icon(Icons.edit, size: 18),
                label: const Text('Edit Name'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1E293B),
                  side: const BorderSide(color: Color(0xFF1E293B), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ] else if (_showTextField) ...[
            // Custom name input
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                maxLength: 12,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1E293B),
                  letterSpacing: 2,
                ),
                decoration: InputDecoration(
                  hintText: 'TYPE SOMETHING FUN...',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400],
                  ),
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: _onCustomNameChanged,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _showTextField = false;
                    if (_nameController.text.trim().isEmpty) {
                      widget.onNameSelected(avatars[_currentAvatarIndex].name);
                    }
                  });
                },
                icon: const Icon(Icons.check, size: 18),
                label: const Text('Confirm Name'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1E293B),
                  side: const BorderSide(color: Color(0xFF1E293B), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],

          const Spacer(),

          Center(
            child: Text(
              'You can always rename it later.',
              style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarData {
  final String name;
  final Color color;
  final String lottieAsset;

  AvatarData({
    required this.name,
    required this.color,
    required this.lottieAsset,
  });
}

class CharacterWidget extends StatelessWidget {
  final String lottieAsset;

  const CharacterWidget({Key? key, required this.lottieAsset})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieAsset,
      width: 180,
      height: 180,
      fit: BoxFit.contain,
    );
  }
}
