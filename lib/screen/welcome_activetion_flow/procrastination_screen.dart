// import 'package:flutter/material.dart';
// import 'package:mobile_app_dea/core/gen/assets.gen.dart';

// class ProcrastinationScreen extends StatelessWidget {
//   const ProcrastinationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           // remove 'const' here
//           image: DecorationImage(
//             image: Assets.svgImages.popupScreeLiner.image().image,
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: Icon(Icons.close, color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 24.0),
//                     child: Text(
//                       'In one line, how does the procrastination show up to you?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF4542EB),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),

//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         width: 270,
//                         height: 270,
//                         decoration: BoxDecoration(
//                           // remove 'const' here
//                           image: DecorationImage(
//                             image: Assets.svgImages.twoColorPopupSpkeing
//                                 .image()
//                                 .image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 180,
//                         height: 180,
//                         decoration: BoxDecoration(
//                           // remove 'const' here
//                           image: DecorationImage(
//                             image: Assets.svgImages.popupSpeking.image().image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Center(
//                           child: ClipOval(
//                             child: Assets.svgImages.popUpSpekingTwoCarton.image(
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 60),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       OutlinedButton(
//                         onPressed: () {},
//                         style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.blue),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 24,
//                             vertical: 12,
//                           ),
//                         ),
//                         child: const Text(
//                           'Choose AI voice',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                       OutlinedButton(
//                         onPressed: () {},
//                         style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.blue),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 24,
//                             vertical: 12,
//                           ),
//                         ),
//                         child: const Text(
//                           'Language',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 40),
//                 ],
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';

class ProcrastinationScreen extends StatelessWidget {
  const ProcrastinationScreen({super.key});

  // Language Bottom Sheet
  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true, // allows custom height/padding
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30), // 30px gap from bottom
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Select Language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  Navigator.pop(context);
                  _showVoiceSheet(context);
                },
              ),
              ListTile(
                title: const Text('Deutsch'),
                onTap: () {
                  Navigator.pop(context);
                  _showVoiceSheet(context);
                },
              ),
              ListTile(
                title: const Text('Español'),
                onTap: () {
                  Navigator.pop(context);
                  _showVoiceSheet(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Voice Bottom Sheet
  void _showVoiceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30), // 30px gap
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Choose Voice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                title: const Text('Male'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text('Female'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.svgImages.popupScreeLiner.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'In one line, how does the procrastination show up to you?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4542EB),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 270,
                        height: 270,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.svgImages.twoColorPopupSpkeing
                                .image()
                                .image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.svgImages.popupSpeking.image().image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Assets.svgImages.popUpSpekingTwoCarton.image(
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Choose AI Voice Button
                      OutlinedButton(
                        onPressed: () => _showVoiceSheet(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'Choose AI voice',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      // Language Button
                      OutlinedButton(
                        onPressed: () => _showLanguageSheet(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'Language',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
