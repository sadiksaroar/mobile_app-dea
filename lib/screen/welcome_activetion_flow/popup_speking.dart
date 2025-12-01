// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';

// class PopupSpeking extends StatefulWidget {
//   const PopupSpeking({super.key});

//   @override
//   State<PopupSpeking> createState() => _PopupSpekingState();
// }

// class _PopupSpekingState extends State<PopupSpeking> {
//   int _popupStep = 0; // 0 = no popup, 1 = mic, 2 = speech recognition

//   void _nextStep() {
//     setState(() {
//       _popupStep++;
//     });
//   }

//   void _showPopup(int step) {
//     setState(() {
//       _popupStep = step;
//     });
//   }

//   void _closePopup() {
//     setState(() {
//       _popupStep = 0;
//     });
//   }

//   Widget _buildPopupContent() {
//     if (_popupStep == 1) {
//       // Microphone permission popup
//       return Container(
//         height: 260,
//         width: 290,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               '"Nowlii" Would Like To Access the Microphone',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               'Nowlii will listen once you say something. Your voice stays private. Always.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13, color: Colors.white70),
//             ),
//             const SizedBox(height: 24),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextButton(
//                     onPressed: _closePopup,
//                     child: const Text(
//                       "Don't Allow",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: _nextStep,
//                     child: const Text(
//                       'Allow',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     } else if (_popupStep == 2) {
//       // Speech recognition permission popup
//       return Container(
//         height: 380,
//         width: 360,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               '"Nowlii" Would Like To Access Speech Recognition',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               'Nowlii uses your voice to personalize sessions and help you stay on track. Speech data may be processed by Apple to recognize and interpret your input.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13, color: Colors.white70),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Your voice stays private and is never stored or shared.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13, color: Colors.white70),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Nowlii listens only to help you - your voice never leaves your device.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13, color: Colors.white70),
//             ),
//             const SizedBox(height: 24),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextButton(
//                     onPressed: _closePopup,
//                     child: const Text(
//                       "Don't Allow",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       _closePopup();
//                       // Navigate to the next page
//                       context.push("/procrastinationScreen");
//                     },
//                     child: const Text(
//                       'Allow',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }
//     return const SizedBox.shrink();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Main content   popupScreeLiner
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: Assets.svgImages.popupSpeaking.image().image,

//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 20,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Close button
//                       GestureDetector(
//                         onTap: () {
//                           context.pop("/onboardingScreen");
//                         },
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Container(
//                             padding: const EdgeInsets.all(6),
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(Icons.close, size: 20),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Text(
//                         "YOU’RE ALL\nSET, JULIE!",
//                         style: GoogleFonts.poppins(
//                           fontSize: 32,
//                           fontWeight: FontWeight.w800,
//                           color: const Color(0xFF042C5C),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "Your Nowli is ready to help you\nstart strong.",
//                         style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xFF39608F),
//                         ),
//                       ),
//                       const SizedBox(height: 30),

//                       // Card section
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(22),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFC3DBFF),
//                           borderRadius: BorderRadius.circular(25),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Let’s do a quick\nvoice check!",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFF06306A),
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               "Tell me how you feel today - no\npressure, just say it out loud.",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xFF5B7BA8),
//                               ),
//                             ),
//                             const SizedBox(height: 25),

//                             // Tapable image to show popup
//                             GestureDetector(
//                               onTap: () => _showPopup(1),
//                               child: Container(
//                                 height: 250,
//                                 width: 250,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                       "assets/svg_images/popupSpeking.png",
//                                     ),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: GestureDetector(
//                                     onTap: () => {},
//                                     child: Image.asset(
//                                       "assets/svg_images/popup_screen_carton.png",
//                                       height: 120,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Text(
//                               "Hold to speak 🎙️",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF315C95),
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Text(
//                               "Nowli will listen once you say something.",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xFF5D7BA5),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Popup overlay
//           if (_popupStep > 0)
//             Container(
//               color: Colors.black.withOpacity(0.85),
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(20),
//               child: _buildPopupContent(),
//             ),
//         ],
//       ),
//     );
//   }
// }

// // Placeholder for the next page
// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Next Page')),
//       body: const Center(
//         child: Text(
//           'You have navigated to the next page!',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';

class PopupSpeking extends StatefulWidget {
  const PopupSpeking({super.key});

  @override
  State<PopupSpeking> createState() => _PopupSpekingState();
}

class _PopupSpekingState extends State<PopupSpeking> {
  int _popupStep = 0; // 0 = no popup, 1 = mic, 2 = speech recognition

  @override
  void initState() {
    super.initState();
    // Page load হওয়ার সাথে সাথে প্রথম popup দেখাবে
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPopup(1);
    });
  }

  void _nextStep() {
    setState(() {
      _popupStep++;
    });
  }

  void _showPopup(int step) {
    setState(() {
      _popupStep = step;
    });
  }

  void _closePopup() {
    setState(() {
      _popupStep = 0;
    });
  }

  Widget _buildPopupContent() {
    if (_popupStep == 1) {
      // Microphone permission popup
      return Container(
        height: 260,
        width: 290,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '"Nowlii" Would Like To Access the Microphone',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Nowlii will listen once you say something. Your voice stays private. Always.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _closePopup,
                    child: const Text(
                      "Don't Allow",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _nextStep,
                    child: const Text(
                      'Allow',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (_popupStep == 2) {
      // Speech recognition permission popup
      return Container(
        height: 380,
        width: 360,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '"Nowlii" Would Like To Access Speech Recognition',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Nowlii uses your voice to personalize sessions and help you stay on track. Speech data may be processed by Apple to recognize and interpret your input.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your voice stays private and is never stored or shared.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),
            const SizedBox(height: 8),
            const Text(
              'Nowlii listens only to help you - your voice never leaves your device.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _closePopup,
                    child: const Text(
                      "Don't Allow",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      _closePopup();
                      // Navigate to the next page
                      context.push("/procrastinationScreen");
                    },
                    child: const Text(
                      'Allow',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content   popupScreeLiner
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.svgImages.popupSpeaking.image().image,
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Close button
                      GestureDetector(
                        onTap: () {
                          context.pop("/onboardingScreen");
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close, size: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "YOU'RE ALL\nSET, JULIE!",
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF042C5C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Your Nowli is ready to help you\nstart strong.",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF39608F),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Card section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC3DBFF),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Let's do a quick\nvoice check!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF06306A),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Tell me how you feel today - no\npressure, just say it out loud.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF5B7BA8),
                              ),
                            ),
                            const SizedBox(height: 25),

                            // Tapable image to show popup
                            GestureDetector(
                              onTap: () => _showPopup(1),
                              child: Container(
                                height: 250,
                                width: 250,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/svg_images/popupSpeking.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () => {},
                                    child: Image.asset(
                                      "assets/svg_images/popup_screen_carton.png",
                                      height: 120,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Hold to speak 🎙️",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF315C95),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Nowli will listen once you say something.",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF5D7BA5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Popup overlay
          if (_popupStep > 0)
            Container(
              color: Colors.black.withOpacity(0.85),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: _buildPopupContent(),
            ),
        ],
      ),
    );
  }
}

// Placeholder for the next page
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: const Center(
        child: Text(
          'You have navigated to the next page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
