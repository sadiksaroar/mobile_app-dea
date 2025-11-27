// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class VoiceOnboardingScreen extends StatefulWidget {
//   const VoiceOnboardingScreen({Key? key}) : super(key: key);

//   @override
//   State<VoiceOnboardingScreen> createState() => _VoiceOnboardingScreenState();
// }

// class _VoiceOnboardingScreenState extends State<VoiceOnboardingScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _pulseController;
//   late AnimationController _listeningController;
//   int _currentStep = 0;
//   bool _isListening = false;
//   String? _selectedVoice;
//   String? _selectedLanguage;
//   bool _showSpeechPermissionDialog = false;
//   bool _showMicPermissionDialog = false;

//   @override
//   void initState() {
//     super.initState();
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();

//     _listeningController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );
//   }

//   @override
//   void dispose() {
//     _pulseController.dispose();
//     _listeningController.dispose();
//     super.dispose();
//   }

//   void _startListening() {
//     setState(() {
//       _isListening = true;
//     });
//     _listeningController.repeat();
//   }

//   void _stopListening() {
//     setState(() {
//       _isListening = false;
//     });
//     _listeningController.stop();
//   }

//   void _nextStep() {
//     setState(() {
//       if (_currentStep < 8) {
//         _currentStep++;
//       }
//     });
//   }

//   void _previousStep() {
//     setState(() {
//       if (_currentStep > 0) {
//         _currentStep--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(gradient: _getGradientForStep()),
//         child: Stack(
//           children: [
//             SafeArea(
//               child: Column(
//                 children: [
//                   Expanded(child: _buildStepContent()),
//                   if (_currentStep <= 5) _buildBottomButtons(),
//                   const SizedBox(height: 24),
//                 ],
//               ),
//             ),
//             if (_currentStep == 0)
//               Positioned(
//                 top: 40,
//                 right: 20,
//                 child: Row(
//                   children: [
//                     Icon(Icons.auto_awesome, color: Colors.white, size: 20),
//                     SizedBox(width: 4),
//                     Text(
//                       'AI',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             if (_currentStep >= 1)
//               Positioned(
//                 top: 40,
//                 left: 20,
//                 child: InkWell(
//                   onTap: _previousStep,
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.3),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(Icons.close, color: Colors.white),
//                   ),
//                 ),
//               ),
//             if (_currentStep >= 1)
//               Positioned(
//                 top: 40,
//                 right: 20,
//                 child: Row(
//                   children: [
//                     Icon(Icons.auto_awesome, color: Colors.white, size: 20),
//                     SizedBox(width: 4),
//                     Text(
//                       'AI',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             if (_showSpeechPermissionDialog) _buildSpeechPermissionDialog(),
//             if (_showMicPermissionDialog) _buildMicPermissionDialog(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStepContent() {
//     switch (_currentStep) {
//       case 0:
//         return _buildMicPermissionStep();
//       case 1:
//         return _buildPermissionStep();
//       case 2:
//         return _buildNoInputStep();
//       case 3:
//         return _buildVoiceSelectionStep();
//       case 4:
//         return _buildLanguageSelectionStep();
//       case 5:
//         return _buildQuestionStep();
//       case 6:
//         // return ();
//         return _buildWelcomeStep();
//       case 7:
//         return _buildListeningStep();
//       case 8:
//         return _buildVoiceCheckStep();
//       default:
//         return Container();
//     }
//   }

//   Widget _buildWelcomeStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'I hear you.',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF5B4FC7),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Thanks for sharing that',
//             style: TextStyle(fontSize: 18, color: Color(0xFF9B8FD9)),
//           ),
//           SizedBox(height: 16),
//           Text(
//             "Let's start!",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF4A3BA8),
//             ),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isSmiling: true),
//         ],
//       ),
//     );
//   }

//   // two nuber page
//   Widget _buildMicPermissionStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "YOU'RE ALL",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1A1A3E),
//               letterSpacing: 2,
//             ),
//           ),
//           Text(
//             "SET, JULIE!",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1A1A3E),
//               letterSpacing: 2,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Your Nowlii is ready to help you',
//             style: TextStyle(fontSize: 16, color: Color(0xFF4A4A6A)),
//           ),
//           Text(
//             'start strong.',
//             style: TextStyle(fontSize: 16, color: Color(0xFF4A4A6A)),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isSmiling: true),
//           SizedBox(height: 40),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 24),
//             padding: EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Color(0xFF3A3A5A),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   '"Nowlii" Would Like To Access the Microphone',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Text(
//                   'Nowlii will listen once you say something. Your voice stays private. Always.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 13, color: Colors.white70),
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Don't Allow",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: _nextStep,
//                         child: Text(
//                           'Allow',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildListeningStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "I'm listening... take your time 👂",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF4A3BA8),
//             ),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isListening: true),
//         ],
//       ),
//     );
//   }

//   Widget _buildNoInputStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "You didn't say anything?",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF5B4FC7),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Hold and speak again.',
//             style: TextStyle(fontSize: 18, color: Color(0xFF9B8FD9)),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(),
//         ],
//       ),
//     );
//   }

//   Widget _buildVoiceSelectionStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "I'm listening... take your time 👂",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF4A3BA8),
//             ),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isListening: true),
//           SizedBox(height: 80),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 24),
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Choose voice',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF2A2A2E),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 _buildVoiceOption('Female', _selectedVoice == 'Female'),
//                 Divider(height: 1),
//                 _buildVoiceOption('Male', _selectedVoice == 'Male'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLanguageSelectionStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "I'm listening... take your time 👂",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF4A3BA8),
//             ),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isListening: true),
//           SizedBox(height: 80),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 24),
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Language',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF2A2A2E),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 _buildLanguageOption('English', _selectedLanguage == 'English'),
//                 Divider(height: 1),
//                 _buildLanguageOption('Deutsch', _selectedLanguage == 'Deutsch'),
//                 Divider(height: 1),
//                 _buildLanguageOption('Español', _selectedLanguage == 'Español'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuestionStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 32),
//             child: Text(
//               'In one line, how does the procrastination show up to you?',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF4A3BA8),
//               ),
//             ),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isListening: true),
//         ],
//       ),
//     );
//   }

//   Widget _buildPermissionStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "YOU'RE ALL",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1A1A3E),
//               letterSpacing: 2,
//             ),
//           ),
//           Text(
//             "SET, JULIE!",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1A1A3E),
//               letterSpacing: 2,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Your Nowlii is ready to help you',
//             style: TextStyle(fontSize: 16, color: Color(0xFF4A4A6A)),
//           ),
//           Text(
//             'start strong.',
//             style: TextStyle(fontSize: 16, color: Color(0xFF4A4A6A)),
//           ),
//           SizedBox(height: 60),
//           _build3DCharacter(isSmiling: true),
//           SizedBox(height: 40),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 24),
//             padding: EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Color(0xFF3A3A5A),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   '"Nowlii" Would Like To Access Speech Recognition',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Text(
//                   'Nowlii uses your voice to personalize sessions and help you stay on track. Speech data may be processed by Apple to recognize and interpret your input.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 13, color: Colors.white70),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Your voice stays private and is never stored or shared.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 13, color: Colors.white70),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Nowlii listens only to help you - your voice never leaves your device.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 13, color: Colors.white70),
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Don't Allow",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: _nextStep,
//                         child: Text(
//                           'Allow',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildVoiceCheckStep() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "YOU'RE ALL",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1A1A3E),
//               letterSpacing: 2,
//             ),
//           ),
//           Text(
//             "SET, JULIE!",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1A1A3E),
//               letterSpacing: 2,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Your Nowlii is ready to help you',
//             style: TextStyle(fontSize: 16, color: Color(0xFF4A4A6A)),
//           ),
//           Text(
//             'start strong.',
//             style: TextStyle(fontSize: 16, color: Color(0xFF4A4A6A)),
//           ),
//           SizedBox(height: 40),
//           Text(
//             "Let's do a quick",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1A1A3E),
//             ),
//           ),
//           Text(
//             "voice check!",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1A1A3E),
//             ),
//           ),
//           SizedBox(height: 12),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 40),
//             child: Text(
//               'Tell me how you feel today - no pressure, just say it out loud. 🎧',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14, color: Color(0xFF6A6A8A)),
//             ),
//           ),
//           SizedBox(height: 40),
//           _build3DCharacter(isSmiling: true),
//           SizedBox(height: 40),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 24),
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.9),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.mic, color: Color(0xFF6A6A8A)),
//                 SizedBox(width: 8),
//                 Text(
//                   'Hold to speak 🗣',
//                   style: TextStyle(fontSize: 16, color: Color(0xFF6A6A8A)),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Nowlii will listen once you say something.',
//             style: TextStyle(fontSize: 13, color: Color(0xFF8A8AAA)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _build3DCharacter({bool isListening = false, bool isSmiling = false}) {
//     return AnimatedBuilder(
//       animation: _pulseController,
//       builder: (context, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             // Outer pulse circle
//             Container(
//               width:
//                   280 +
//                   (isListening
//                       ? math.sin(_pulseController.value * 2 * math.pi) * 20
//                       : 0),
//               height:
//                   280 +
//                   (isListening
//                       ? math.sin(_pulseController.value * 2 * math.pi) * 20
//                       : 0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFB8B0F5).withOpacity(0.3),
//               ),
//             ),
//             // Middle pulse circle
//             Container(
//               width:
//                   220 +
//                   (isListening
//                       ? math.sin(_pulseController.value * 2 * math.pi) * 15
//                       : 0),
//               height:
//                   220 +
//                   (isListening
//                       ? math.sin(_pulseController.value * 2 * math.pi) * 15
//                       : 0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFF9B8FD9).withOpacity(0.4),
//               ),
//             ),
//             // Inner circle
//             Container(
//               width: 180,
//               height: 180,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFF6B5FD8),
//               ),
//             ),
//             // Character
//             SizedBox(
//               width: 120,
//               height: 120,
//               child: CustomPaint(
//                 painter: Character3DPainter(
//                   isListening: isListening,
//                   isSmiling: isSmiling,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildVoiceOption(String voice, bool isSelected) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedVoice = voice;
//         });
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               voice,
//               style: TextStyle(fontSize: 16, color: Color(0xFF2A2A2E)),
//             ),
//             if (isSelected) Icon(Icons.check, color: Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguageOption(String language, bool isSelected) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedLanguage = language;
//         });
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               language,
//               style: TextStyle(fontSize: 16, color: Color(0xFF2A2A2E)),
//             ),
//             if (isSelected) Icon(Icons.check, color: Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomButtons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Row(
//         children: [
//           Expanded(
//             child: OutlinedButton(
//               onPressed: _nextStep,
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 side: BorderSide(color: Color(0xFF6B5FD8), width: 2),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Text(
//                 'Choose AI voice',
//                 style: TextStyle(
//                   color: Color(0xFF6B5FD8),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: OutlinedButton(
//               onPressed: _nextStep,
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 side: BorderSide(color: Color(0xFF6B5FD8), width: 2),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Text(
//                 'English',
//                 style: TextStyle(
//                   color: Color(0xFF6B5FD8),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSpeechPermissionDialog() {
//     return Container(
//       color: Colors.black54,
//       child: Center(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 24),
//           padding: EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Color(0xFF3A3A5A),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '"Nowlii" Would Like To Access Speech Recognition',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Nowlii uses your voice to personalize sessions and help you stay on track.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 13, color: Colors.white70),
//               ),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _showSpeechPermissionDialog = false;
//                         });
//                       },
//                       child: Text(
//                         "Don't Allow",
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _showSpeechPermissionDialog = false;
//                         });
//                         _nextStep();
//                       },
//                       child: Text(
//                         'Allow',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMicPermissionDialog() {
//     return Container(
//       color: Colors.black54,
//       child: Center(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 24),
//           padding: EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Color(0xFF3A3A5A),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '"Nowlii" Would Like To Access the Microphone',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Nowlii will listen once you say something. Your voice stays private.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 13, color: Colors.white70),
//               ),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _showMicPermissionDialog = false;
//                         });
//                       },
//                       child: Text(
//                         "Don't Allow",
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _showMicPermissionDialog = false;
//                         });
//                         _nextStep();
//                       },
//                       child: Text(
//                         'Allow',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   LinearGradient _getGradientForStep() {
//     if (_currentStep >= 6) {
//       return const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [Color(0xFF8FE5B8), Color(0xFF6BC9E8), Color(0xFFB8B0F5)],
//       );
//     }

//     return const LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Color(0xFFB8B0F5), Color(0xFF8B7FE8)],
//     );
//   }
// }

// class Character3DPainter extends CustomPainter {
//   final bool isListening;
//   final bool isSmiling;

//   Character3DPainter({required this.isListening, required this.isSmiling});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..style = PaintingStyle.fill;

//     // Body (orange gradient)
//     final bodyRect = RRect.fromRectAndRadius(
//       Rect.fromCenter(
//         center: Offset(size.width / 2, size.height * 0.6),
//         width: size.width * 0.7,
//         height: size.height * 0.6,
//       ),
//       const Radius.circular(40),
//     );

//     paint.shader = const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: [Color(0xFFFFB366), Color(0xFFFF8C42)],
//     ).createShader(bodyRect.outerRect);

//     canvas.drawRRect(bodyRect, paint);

//     // Head (lighter orange)
//     final headCenter = Offset(size.width / 2, size.height * 0.25);
//     paint.shader =
//         const RadialGradient(
//           colors: [Color(0xFFFFCC66), Color(0xFFFFB347)],
//         ).createShader(
//           Rect.fromCircle(center: headCenter, radius: size.width * 0.35),
//         );

//     canvas.drawCircle(headCenter, size.width * 0.35, paint);

//     // Eyes
//     paint.shader = null;
//     paint.color = const Color(0xFF2A2A2E);

//     final leftEye = Offset(size.width * 0.4, size.height * 0.22);
//     final rightEye = Offset(size.width * 0.6, size.height * 0.22);

//     if (isSmiling) {
//       // Closed happy eyes
//       paint.style = PaintingStyle.stroke;
//       paint.strokeWidth = 3;
//       canvas.drawArc(
//         Rect.fromCenter(center: leftEye, width: 15, height: 8),
//         0,
//         math.pi,
//         false,
//         paint,
//       );
//       canvas.drawArc(
//         Rect.fromCenter(center: rightEye, width: 15, height: 8),
//         0,
//         math.pi,
//         false,
//         paint,
//       );
//       paint.style = PaintingStyle.fill;
//     } else {
//       // Open eyes
//       canvas.drawCircle(leftEye, 5, paint);
//       canvas.drawCircle(rightEye, 5, paint);
//     }

//     // Mouth
//     paint.color = const Color(0xFF2A2A2E);
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 2;

//     final mouthRect = Rect.fromCenter(
//       center: Offset(size.width / 2, size.height * 0.32),
//       width: size.width * 0.25,
//       height: size.height * 0.12,
//     );

//     canvas.drawArc(mouthRect, 0, math.pi, false, paint);

//     // Arms (small)
//     paint.style = PaintingStyle.fill;
//     paint.color = const Color(0xFFFF8C42);

//     final leftArm = RRect.fromRectAndRadius(
//       Rect.fromLTWH(
//         size.width * 0.05,
//         size.height * 0.5,
//         size.width * 0.15,
//         size.height * 0.25,
//       ),
//       Radius.circular(15),
//     );
//     canvas.drawRRect(leftArm, paint);

//     final rightArm = RRect.fromRectAndRadius(
//       Rect.fromLTWH(
//         size.width * 0.8,
//         size.height * 0.5,
//         size.width * 0.15,
//         size.height * 0.25,
//       ),
//       Radius.circular(15),
//     );
//     canvas.drawRRect(rightArm, paint);
//   }

//   @override
//   bool shouldRepaint(Character3DPainter oldDelegate) {
//     return oldDelegate.isListening != isListening ||
//         oldDelegate.isSmiling != isSmiling;
//   }
// }
