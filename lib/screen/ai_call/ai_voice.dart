// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';

// class AiVoice extends StatefulWidget {
//   const AiVoice({super.key});

//   @override
//   State<AiVoice> createState() => _AiVoiceState();
// }

// class _AiVoiceState extends State<AiVoice> {
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
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const NextPage(),
//                         ),
//                       );
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
//                           context.pop("popPoSahre");
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
//                                     // onTap: () => {
//                                     //   context.push("/procrastinationScreen"),
//                                     // },
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
import 'dart:async';

class AiVoice extends StatefulWidget {
  const AiVoice({super.key});

  @override
  State<AiVoice> createState() => _AiVoiceState();
}

class _AiVoiceState extends State<AiVoice> {
  int currentSeconds = 81; // 01:21
  final int totalSeconds = 600; // 10:00
  bool isPaused = true;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (isPaused) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (currentSeconds > 0) {
          setState(() => currentSeconds--);
        } else {
          timer.cancel();
        }
      });
    } else {
      _timer?.cancel();
    }
    setState(() => isPaused = !isPaused);
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F0FE), Color(0xFFC8DDFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Title Section
              const Text(
                'Answer emails 📧',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You\'re doing great — keep it going',
                style: TextStyle(fontSize: 16, color: Color(0xFF5C6BC0)),
              ),

              const Spacer(),

              // Character Animation
              Stack(
                alignment: Alignment.center,
                children: [
                  // Outer circle
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  // Middle circle
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF5C6BC0).withOpacity(0.6),
                          const Color(0xFF3949AB).withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  // Inner circle with character
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF3949AB),
                    ),
                    child: const Center(
                      child: Text('🦆', style: TextStyle(fontSize: 80)),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Timer Display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isPaused ? Icons.pause : Icons.play_arrow,
                    color: const Color(0xFF3949AB),
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: _formatTime(currentSeconds),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3949AB),
                          ),
                        ),
                        TextSpan(
                          text: ' / ${_formatTime(totalSeconds)}',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3949AB).withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Control Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sound button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up),
                      color: const Color(0xFF3949AB),
                      iconSize: 28,
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Mute button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_off),
                      color: const Color(0xFF3949AB),
                      iconSize: 28,
                    ),
                  ),
                  const SizedBox(width: 60),

                  // Mark as done button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check),
                      color: const Color(0xFF3949AB),
                      iconSize: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Mark as done',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF3949AB),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
