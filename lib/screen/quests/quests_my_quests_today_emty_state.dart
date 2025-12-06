import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/custom_code/BottomNav.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/blocking/blockng.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/completed/completed.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/scheduled/scheduled.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/today/today.dart';
import 'package:mobile_app_dea/screen/quests/suggested/soft_steps/soft_steps.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class QuestHomePage extends StatefulWidget {
  const QuestHomePage({super.key});

  @override
  State<QuestHomePage> createState() => _QuestHomePageState();
}

class _QuestHomePageState extends State<QuestHomePage>
    with TickerProviderStateMixin {
  late TabController mainTab;
  late TabController myQuestsTab;
  late TabController suggestedTab;

  @override
  void initState() {
    super.initState();
    mainTab = TabController(length: 2, vsync: this);
    myQuestsTab = TabController(length: 4, vsync: this);
    suggestedTab = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    mainTab.dispose();
    myQuestsTab.dispose();
    suggestedTab.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go(AppRoutespath.homeScreen);
        break;
      case 1:
        context.go(AppRoutespath.questHomePage);
        break;
      case 2:
        context.go(AppRoutespath.progress);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFEFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFEFFF),
        elevation: 0,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("QUESTS", style: AppsTextStyles.SaimTitle),
            const SizedBox(height: 6),
            Text(
              "Small steps, big progress.",
              style: AppsTextStyles.workSansRegularF16,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.push("/createQuestPage");
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                Assets.svgIcons.quests.path,
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFEF8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TabBar(
                controller: mainTab,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5.0, color: Color(0xFF4542EB)),
                  insets: EdgeInsets.symmetric(horizontal: 0.0),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xFFADB2BC),
                labelStyle: AppsTextStyles.workSansExtraBold20,
                unselectedLabelStyle: AppsTextStyles.workSansy6ExtraBold20,
                tabs: const [
                  Tab(text: "My quests"),
                  Tab(text: "Suggested"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: mainTab,
                  children: [_buildMyQuestSection(), _suggests()],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  // ---------------- QUESTS PAGE ---------------- my quests section
  Widget _buildMyQuestSection() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
            controller: myQuestsTab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: const Color(0xFFC3DBFF),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: const Color(0xFFC3DBFF), width: 2),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            tabs: List.generate(4, (index) {
              final titles = [
                'Todays(3)',
                'Scheduled',
                'Completed',
                'Blocking',
              ];
              bool isSelected = myQuestsTab.index == index;
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: myQuestsTab,
            children: [Today(), Scheduled(), Completed(), Blockng()],
          ),
        ),
      ],
    );
  }

  // ---------------- SUGGESTED PAGE ----------------
  Widget _suggests() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
            controller: suggestedTab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: const Color(0xFFC3DBFF),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: const Color(0xFFC3DBFF), width: 2),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            tabs: List.generate(3, (index) {
              final titles = ['Soft steps', 'Stretch zone', 'Elevated'];
              bool isSelected = suggestedTab.index == index;
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: suggestedTab,
            children: [
              ShuffleScreen(),
              Today(), // Replace with actual widget for Stretch zone
              Today(), // Replace with actual widget for Elevated
            ],
          ),
        ),
      ],
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
import 'package:mobile_app_dea/custom_code/BottomNav.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/blocking/blockng.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/completed/completed.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/scheduled/scheduled.dart';
import 'package:mobile_app_dea/screen/quests/my_quets/today/today.dart';
import 'package:mobile_app_dea/screen/quests/suggested/soft_steps/soft_steps.dart';
import 'package:mobile_app_dea/themes/text_styles.dart';

class QuestHomePage extends StatefulWidget {
  const QuestHomePage({super.key});

  @override
  State<QuestHomePage> createState() => _QuestHomePageState();
}

class _QuestHomePageState extends State<QuestHomePage>
    with TickerProviderStateMixin {
  late TabController mainTab;
  late TabController myQuestsTab;
  late TabController suggestedTab;

  @override
  void initState() {
    super.initState();
    mainTab = TabController(length: 2, vsync: this);
    myQuestsTab = TabController(length: 4, vsync: this);
    suggestedTab = TabController(length: 3, vsync: this);

    // Listen to main tab changes to update background color
    mainTab.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    mainTab.dispose();
    myQuestsTab.dispose();
    suggestedTab.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go(AppRoutespath.homeScreen);
        break;
      case 1:
        context.go(AppRoutespath.questHomePage);
        break;
      case 2:
        context.go(AppRoutespath.progress);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Change background color based on selected tab
    Color backgroundColor = mainTab.index == 0
        ? const Color(0xFFDFEFFF) // My Quests tab color
        : const Color(0xFFDFEFFF); // Suggested tab color (same color)

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("QUESTS", style: AppsTextStyles.SaimTitle),
            const SizedBox(height: 6),
            Text(
              "Small steps, big progress.",
              style: AppsTextStyles.workSansRegularF16,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.push("/createQuestPage");
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                Assets.svgIcons.quests.path,
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFEF8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TabBar(
                controller: mainTab,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5.0, color: Color(0xFF4542EB)),
                  insets: EdgeInsets.symmetric(horizontal: 0.0),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xFFADB2BC),
                labelStyle: AppsTextStyles.workSansExtraBold20,
                unselectedLabelStyle: AppsTextStyles.workSansy6ExtraBold20,
                tabs: const [
                  Tab(text: "My quests"),
                  Tab(text: "Suggested"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: mainTab,
                  children: [_buildMyQuestSection(), _suggests()],
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Divider(color: Colors.grey[400], thickness: 1),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //       child: Text(
              //         "End of My Quests",
              //         // style: AppsTextStyles.workSansRegular14Grey,
              //       ),
              //     ),
              //     Expanded(
              //       child: Divider(color: Colors.grey[400], thickness: 1),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  // ---------------- QUESTS PAGE ---------------- my quests section
  Widget _buildMyQuestSection() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
            controller: myQuestsTab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: const Color(0xFFC3DBFF),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: const Color(0xFFC3DBFF), width: 2),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            tabs: List.generate(4, (index) {
              final titles = [
                'Todays(3)',
                'Scheduled',
                'Completed',
                'Blocking',
              ];
              bool isSelected = myQuestsTab.index == index;
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: myQuestsTab,
            children: [Today(), Scheduled(), Completed(), Blockng()],
          ),
        ),
      ],
    );
  }

  // ---------------- SUGGESTED PAGE ----------------
  Widget _suggests() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
            controller: suggestedTab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: const Color(0xFFC3DBFF),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: const Color(0xFFC3DBFF), width: 2),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            tabs: List.generate(3, (index) {
              final titles = ['Soft steps', 'Stretch zone', 'Elevated'];
              bool isSelected = suggestedTab.index == index;
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: suggestedTab,
            children: [
              ShuffleScreen(),
              Today(), // Replace with actual widget for Stretch zone
              Today(), // Replace with actual widget for Elevated
            ],
          ),
        ),
      ],
    );
  }
}
*/