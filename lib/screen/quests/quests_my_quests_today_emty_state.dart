import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show svg;
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_dea/core/gen/assets.gen.dart';
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

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // ---------------- APP BAR ----------------
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
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            // child: const Icon(Icons.add, color: Colors.white),
            // child: Assets.svgIcons.buttonCalendar.path(width: 24, height: 24),
            child: Image.asset(
              Assets.svgIcons.buttonCalendarPng.path,
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),

      // ---------------- BODY ----------------
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
                // REMOVE hover / overlay
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                // REMOVE splash effect
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
              color: Color(0xFFC3DBFF),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Color(0xFFC3DBFF), width: 2),
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
            tabs: [
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: myQuestsTab.index == 0
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: myQuestsTab.index == 0
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Todays(3)',
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: myQuestsTab.index == 1
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: myQuestsTab.index == 1
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Scheduled',
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: myQuestsTab.index == 2
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: myQuestsTab.index == 2
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Completed',
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: myQuestsTab.index == 3
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: myQuestsTab.index == 3
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: const Center(child: Text('Blocking')),
                ),
              ),
            ],
          ),
        ),

        // ------ Body ------
        Expanded(
          child: TabBarView(
            controller: myQuestsTab,
            children: [Today(), Scheduled(), Completed(), Blockng()],
          ),
        ),
      ],
    );
  }

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
              color: Color(0xFFC3DBFF),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Color(0xFFC3DBFF), width: 2),
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
            tabs: [
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: suggestedTab.index == 0
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: suggestedTab.index == 0
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Soft steps',
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: suggestedTab.index == 1
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: suggestedTab.index == 1
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Stretch zone',
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 45,
                  decoration: BoxDecoration(
                    color: suggestedTab.index == 2
                        ? const Color(0xFFC3DBFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: suggestedTab.index == 2
                          ? const Color(0xFFC3DBFF)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Elevated',
                      style: AppsTextStyles.workSansSemiBold18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ------ Body ------
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
