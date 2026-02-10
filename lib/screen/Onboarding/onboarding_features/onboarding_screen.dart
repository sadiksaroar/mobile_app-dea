// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';
// import 'package:mobile_app_dea/themes/text_styles.dart';
// import 'package:mobile_app_dea/utlis/color_palette/color_palette.dart';
// import 'package:mobile_app_dea/widget/custom_button.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   String _selectedName = '';
//   final String _selectedGender = '';

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _completeOnboarding() {
//     // print('Name: $_selectedName, Gender: $_selectedGender');
//     // Navigate to the next screen
//     context.push("/popupSpeking");
//   }

//   bool _canProceed() {
//     if (_currentPage == 0) {
//       return _selectedName.isNotEmpty;
//     } else if (_currentPage == 1) {
//       return _selectedGender.isNotEmpty;
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFF5E6),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 physics: const NeverScrollableScrollPhysics(),
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 children: [
//                   NameSelectionPage(
//                     selectedName: _selectedName,
//                     onNameSelected: (name) {
//                       setState(() {
//                         _selectedName = name;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             _buildNextButton(),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Back button
//           GestureDetector(
//             onTap: () {
//               context.push("/onbordingFetures");
//             },
//             child: SizedBox(
//               height: 56,
//               width: 56,
//               child: CircleAvatar(
//                 child: Assets.svgIcons.backIconSvg.svg(height: 56, width: 56),
//               ),
//             ),
//           ),

//           SizedBox(width: 20),

//           // Progress bar
//           Expanded(
//             child: Container(
//               height: 10,
//               decoration: ShapeDecoration(
//                 color: const Color(0xFFC3DBFF),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(999),
//                 ),
//               ),
//               child: FractionallySizedBox(
//                 alignment: Alignment.centerLeft,
//                 widthFactor: 0.5, // 3/6 = 0.5
//                 child: Container(
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFF3D87F5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(999),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           SizedBox(width: 15),

//           // Progress text
//           Text(
//             '6/6',
//             style: TextStyle(
//               color: const Color(0xFF4C586E),
//               fontSize: 12,
//               fontFamily: 'Work Sans',
//               fontWeight: FontWeight.w400,
//               height: 1.40,
//             ),
//           ),

//           // SizedBox(width: 5),

//           // Skip button - Fixed navigation
//           GestureDetector(
//             onTap: () {
//               context.push("/onboardingScreen"); // Skip to next screen
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Text(
//                 'Skip',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: const Color(0xFF011F54),
//                   fontSize: 18,
//                   fontFamily: 'Work Sans',
//                   fontWeight: FontWeight.w900,
//                   height: 0.80,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNextButton() {
//     return CustomNextButton(
//       isEnabled: _canProceed(),
//       onTap: () {
//         context.push("/popupSpeking");
//       },
//       buttonText: 'NEXT',
//       iconPath: Assets.svgIcons.startLetsGo.path,
//       textStyle: AppsTextStyles.letsStartNext,
//     );
//   }
// }

// class NameSelectionPage extends StatefulWidget {
//   final String selectedName;
//   final Function(String) onNameSelected;

//   const NameSelectionPage({
//     super.key,
//     required this.selectedName,
//     required this.onNameSelected,
//   });

//   @override
//   State<NameSelectionPage> createState() => _NameSelectionPageState();
// }

// class _NameSelectionPageState extends State<NameSelectionPage>
//     with SingleTickerProviderStateMixin {
//   final TextEditingController _nameController = TextEditingController();
//   late AnimationController _bounceController;
//   late Animation<double> _bounceAnimation;

//   bool _showTextField = false;
//   int _currentAvatarIndex = 0;
//   bool _isAnimating = true;
//   bool _showNameDisplay = false;

//   // Avatar list with PNG images
//   final List<AvatarData> avatars = [
//     AvatarData(
//       name: 'KNOTTY',
//       assetPath: 'assets/svg_images/A.png',
//       isLottie: false,
//     ),
//     AvatarData(
//       name: 'BLOOBY',
//       assetPath: 'assets/svg_images/B.png',
//       isLottie: false,
//     ),
//     AvatarData(
//       name: 'FIZZY',
//       assetPath: 'assets/svg_images/C.png',
//       isLottie: false,
//     ),
//     AvatarData(
//       name: 'BOUNCY',
//       assetPath: 'assets/svg_images/D.png',
//       isLottie: false,
//     ),
//     AvatarData(
//       name: 'ZIPPY',
//       assetPath: 'assets/svg_images/E.png',
//       isLottie: false,
//     ),
//     AvatarData(
//       name: 'MELON',
//       assetPath: 'assets/svg_images/F.png',
//       isLottie: false,
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _bounceController = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );

//     _bounceAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
//       CurvedAnimation(parent: _bounceController, curve: Curves.elasticOut),
//     );

//     _startAutoRotation();
//   }

//   void _startAutoRotation() async {
//     // Auto-rotate through avatars every 3 seconds
//     for (int i = 0; i < avatars.length; i++) {
//       if (!mounted || !_isAnimating) break;

//       await Future.delayed(const Duration(seconds: 3));

//       if (!mounted || !_isAnimating) break;

//       setState(() {
//         _currentAvatarIndex = (i + 1) % avatars.length;
//       });
//       _bounceController.forward(from: 0);
//     }

//     // After showing all avatars, show the name display
//     if (mounted && _isAnimating) {
//       setState(() {
//         _isAnimating = false;
//         _showNameDisplay = true;
//       });
//       widget.onNameSelected(avatars[_currentAvatarIndex].name);
//     }
//   }

//   void _rotateAvatar() {
//     setState(() {
//       _currentAvatarIndex = (_currentAvatarIndex + 1) % avatars.length;
//       _showTextField = false;
//       _nameController.clear();
//     });
//     widget.onNameSelected(avatars[_currentAvatarIndex].name);
//     _bounceController.forward(from: 0);
//   }

//   void _showCustomNameInput() {
//     setState(() {
//       _showTextField = true;
//     });
//   }

//   void _onCustomNameChanged(String value) {
//     if (value.trim().length >= 2 && value.trim().length <= 12) {
//       widget.onNameSelected(value.trim());
//       _bounceController.forward(from: 0);
//     } else if (value.trim().isEmpty) {
//       widget.onNameSelected('');
//     }
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _bounceController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'HOW WOULD YOU LIKE TO\nCALL IT?',
//               style: AppsTextStyles.letsStartNext,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Give your form a name.',
//               style: AppsTextStyles.passwordDescription,
//             ),
//             const SizedBox(height: 32),

//             // Character with animation and border radius
//             ScaleTransition(
//               scale: _bounceAnimation,
//               child: Container(
//                 height: screenHeight * 0.25,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Center(
//                   child: CharacterWidget(
//                     assetPath: _showTextField
//                         ? avatars[0].assetPath
//                         : avatars[_currentAvatarIndex].assetPath,
//                     isLottie: _showTextField
//                         ? avatars[0].isLottie
//                         : avatars[_currentAvatarIndex].isLottie,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 32),

//             // Show loading indicator during animation
//             if (_isAnimating) ...[
//               Center(
//                 child: Column(
//                   children: const [
//                     CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         Color(0xFF4169E1),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Discovering your character...',
//                       style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
//                     ),
//                   ],
//                 ),
//               ),
//             ]
//             // Name display or input after animation
//             else if (!_showTextField && _showNameDisplay) ...[
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       avatars[_currentAvatarIndex].name,
//                       style: AppsTextStyles.signupText28,
//                     ),
//                     const SizedBox(width: 16),
//                     GestureDetector(
//                       onTap: _rotateAvatar,
//                       child: Image.asset(
//                         Assets.svgIcons.buttonRegular.path,
//                         width: 66,
//                         height: 44,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: SizedBox(
//                   width: 320,
//                   height: 50,
//                   child: OutlinedButton.icon(
//                     onPressed: _showCustomNameInput,
//                     icon: Image.asset(
//                       Assets.svgIcons.onBordingPlus.path,
//                       width: 18,
//                       height: 18,
//                     ),
//                     label: Text(
//                       'Choose your own name',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.workSans(
//                         color: const Color(0xFF011F54),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w900,
//                         height: 0.80,
//                       ),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: AppColorsApps.darkBlue,
//                       side: const BorderSide(
//                         color: AppColorsApps.darkBlue,
//                         width: 2,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 12,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ] else if (_showTextField) ...[
//               // Custom name input
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 4,
//                 ),
//                 child: TextField(
//                   controller: _nameController,
//                   textAlign: TextAlign.center,
//                   maxLength: 12,
//                   autofocus: true,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w900,
//                     color: Color(0xFF1E293B),
//                     letterSpacing: 2,
//                   ),
//                   decoration: InputDecoration(
//                     hintText: 'TYPE SOMETHING FUN...',
//                     hintStyle: AppsTextStyles.typeSomeThingHere,
//                     border: InputBorder.none,
//                     counterText: '',
//                   ),
//                   onChanged: _onCustomNameChanged,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: SizedBox(
//                   width: 320,
//                   height: 50,
//                   child: OutlinedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         _showTextField = false;
//                         _showNameDisplay = true;
//                         if (_nameController.text.trim().isEmpty) {
//                           widget.onNameSelected(
//                             avatars[_currentAvatarIndex].name,
//                           );
//                         }
//                       });
//                     },
//                     icon: const Icon(Icons.close, size: 18),
//                     label: Text(
//                       'Back to suggestions',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.workSans(
//                         color: const Color(0xFF011F54),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w900,
//                         height: 0.80,
//                       ),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: AppColorsApps.darkBlue,
//                       side: const BorderSide(
//                         color: AppColorsApps.darkBlue,
//                         width: 2,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 12,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],

//             const SizedBox(height: 40),

//             Center(
//               child: const Text(
//                 'You can always rename it later.',
//                 style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Avatar data model
// class AvatarData {
//   final String name;
//   final String assetPath;
//   final bool isLottie;

//   AvatarData({
//     required this.name,
//     required this.assetPath,
//     this.isLottie = false,
//   });
// }

// // Character widget with border radius applied to images
// class CharacterWidget extends StatelessWidget {
//   final String assetPath;
//   final bool isLottie;

//   const CharacterWidget({
//     super.key,
//     required this.assetPath,
//     this.isLottie = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (isLottie) {
//       // Lottie animations with border radius
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(25),
//         child: Lottie.asset(
//           assetPath,
//           width: 180,
//           height: 180,
//           fit: BoxFit.contain,
//         ),
//       );
//     } else {
//       // PNG/JPG images with border radius
//       // return ClipRRect(
//       //   borderRadius: BorderRadius.circular(25),
//       //   child: Image.asset(
//       //     assetPath,
//       //     width: 180,
//       //     height: 180,
//       //     fit: BoxFit.contain,
//       //   ),
//       // );

//       return Container(
//   width: 338,
//   height: 231,
//   decoration: ShapeDecoration(

//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//   ),
//   child: Image.asset(
//           assetPath,
//           width: 180,
//           height: 180,
//           fit: BoxFit.contain,
//         ),,
//       )

//   )
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';
import 'package:mobile_app_dea/utlis/color_palette/color_palette.dart';
import 'package:mobile_app_dea/widget/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  String _selectedName = '';
  final String _selectedGender = '';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _completeOnboarding() {
    // print('Name: $_selectedName, Gender: $_selectedGender');
    // Navigate to the next screen
    context.push("/popupSpeking");
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back button
          GestureDetector(
            onTap: () {
              context.push("/onbordingFetures");
            },
            child: SizedBox(
              height: 56,
              width: 56,
              child: CircleAvatar(
                child: Assets.svgIcons.backIconSvg.svg(height: 56, width: 56),
              ),
            ),
          ),

          SizedBox(width: 20),

          // Progress bar
          Expanded(
            child: Container(
              height: 10,
              decoration: ShapeDecoration(
                color: const Color(0xFFC3DBFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.5, // 3/6 = 0.5
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3D87F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: 15),

          // Progress text
          Text(
            '6/6',
            style: TextStyle(
              color: const Color(0xFF4C586E),
              fontSize: 12,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
          ),

          // SizedBox(width: 5),

          // Skip button - Fixed navigation
          GestureDetector(
            onTap: () {
              context.push("/onboardingScreen"); // Skip to next screen
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF011F54),
                  fontSize: 18,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w900,
                  height: 0.80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return CustomNextButton(
      isEnabled: _canProceed(),
      onTap: () {
        context.push("/popupSpeking");
      },
      buttonText: 'NEXT',
      iconPath: Assets.svgIcons.startLetsGo.path,
      textStyle: AppsTextStyles.letsStartNext,
    );
  }
}

class NameSelectionPage extends StatefulWidget {
  final String selectedName;
  final Function(String) onNameSelected;

  const NameSelectionPage({
    super.key,
    required this.selectedName,
    required this.onNameSelected,
  });

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

  // Avatar list with PNG images
  final List<AvatarData> avatars = [
    AvatarData(
      name: 'KNOTTY',
      assetPath: 'assets/svg_images/A.png',
      isLottie: false,
    ),
    AvatarData(
      name: 'BLOOBY',
      assetPath: 'assets/svg_images/B.png',
      isLottie: false,
    ),
    AvatarData(
      name: 'FIZZY',
      assetPath: 'assets/svg_images/C.png',
      isLottie: false,
    ),
    AvatarData(
      name: 'BOUNCY',
      assetPath: 'assets/svg_images/D.png',
      isLottie: false,
    ),
    AvatarData(
      name: 'ZIPPY',
      assetPath: 'assets/svg_images/E.png',
      isLottie: false,
    ),
    AvatarData(
      name: 'MELON',
      assetPath: 'assets/svg_images/F.png',
      isLottie: false,
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
    } else if (value.trim().isEmpty) {
      widget.onNameSelected('');
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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HOW WOULD YOU LIKE TO\nCALL IT?',
              style: AppsTextStyles.letsStartNext,
            ),
            const SizedBox(height: 8),
            Text(
              'Give your form a name.',
              style: AppsTextStyles.passwordDescription,
            ),
            const SizedBox(height: 32),

            // Character with animation and border radius
            ScaleTransition(
              scale: _bounceAnimation,
              child: Container(
                height: screenHeight * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: CharacterWidget(
                    assetPath: _showTextField
                        ? avatars[0].assetPath
                        : avatars[_currentAvatarIndex].assetPath,
                    // isLottie: _showTextField
                    //     ? avatars[0].isLottie
                    //     : avatars[_currentAvatarIndex].isLottie,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Show loading indicator during animation
            if (_isAnimating) ...[
              Center(
                child: Column(
                  children: const [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF4169E1),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Discovering your character...',
                      style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
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
                      style: AppsTextStyles.signupText28,
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: _rotateAvatar,
                      child: Image.asset(
                        Assets.svgIcons.buttonRegular.path,
                        width: 66,
                        height: 44,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: _showCustomNameInput,
                    icon: Image.asset(
                      Assets.svgIcons.onBordingPlus.path,
                      width: 18,
                      height: 18,
                    ),
                    label: Text(
                      'Choose your own name',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                        color: const Color(0xFF011F54),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        height: 0.80,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColorsApps.darkBlue,
                      side: const BorderSide(
                        color: AppColorsApps.darkBlue,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ] else if (_showTextField) ...[
              // Custom name input
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
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
                    hintStyle: AppsTextStyles.typeSomeThingHere,
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: _onCustomNameChanged,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showTextField = false;
                        _showNameDisplay = true;
                        if (_nameController.text.trim().isEmpty) {
                          widget.onNameSelected(
                            avatars[_currentAvatarIndex].name,
                          );
                        }
                      });
                    },
                    icon: const Icon(Icons.close, size: 18),
                    label: Text(
                      'Back to suggestions',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                        color: const Color(0xFF011F54),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        height: 0.80,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColorsApps.darkBlue,
                      side: const BorderSide(
                        color: AppColorsApps.darkBlue,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 40),

            Center(
              child: const Text(
                'You can always rename it later.',
                style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Avatar data model
class AvatarData {
  final String name;
  final String assetPath;
  final bool isLottie;

  AvatarData({
    required this.name,
    required this.assetPath,
    this.isLottie = false,
  });
}
/*
// Character widget with border radius applied to images
class CharacterWidget extends StatelessWidget {
  final String assetPath;
  final bool isLottie;

  const CharacterWidget({
    super.key,
    required this.assetPath,
    this.isLottie = false,
  });

  @override
  Widget build(BuildContext context) {
    // if (isLottie) {
    //   // Lottie animations with border radius
    //   return ClipRRect(
    //     borderRadius: BorderRadius.circular(25),
    //     child: Lottie.asset(
    //       assetPath,
    //       width: 180,
    //       height: 180,
    //       fit: BoxFit.contain,
    //     ),
    //   );
    // } else {
    // PNG/JPG images with border radius
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Image.asset(
        assetPath,
        width: 338,
        height: 160,
        fit: BoxFit.contain,
      ),
    );
    // }
  }
}
*/

class CharacterWidget extends StatelessWidget {
  final String assetPath;

  const CharacterWidget({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24), // ✅ rounded corner
      child: Image.asset(
        assetPath,
        width: 260,
        height: 210,
        fit: BoxFit.cover, // ✅ image full fill করবে
      ),
    );
  }
}
