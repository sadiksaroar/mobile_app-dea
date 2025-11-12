import 'package:flutter/material.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({Key? key}) : super(key: key);

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  String userName = '';
  String selectedGender = '';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 4) {
      setState(() {
        currentPage++;
      });
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      /*
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );*/
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void updateName(String name) {
    setState(() {
      userName = name;
    });
  }

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6E4F0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: previousPage,
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: (currentPage + 1) / 5,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4E5FFF),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${currentPage + 1}/5',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A2B5F),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // NamePage(
                  //   onContinue: nextPage,
                  //   onNameChanged: updateName,
                  //   initialName: userName,
                  // ),
                  // GenderPage(
                  //   userName: userName,
                  //   selectedGender: selectedGender,
                  //   onGenderSelected: selectGender,
                  // ),
                  // GenderPageVariant(
                  //   userName: userName,
                  //   selectedGender: selectedGender,
                  //   onGenderSelected: selectGender,
                  // ),
                  // PlaceholderPage(
                  //   pageTitle: 'Additional Page 1',
                  //   onContinue: nextPage,
                  // ),
                  // PlaceholderPage(
                  //   pageTitle: 'Additional Page 2',
                  //   onContinue: nextPage,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
