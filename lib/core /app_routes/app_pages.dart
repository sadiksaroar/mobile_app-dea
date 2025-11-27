import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/screen/Onboarding/loading_onboridng_nowli.dart';
import 'package:mobile_app_dea/screen/Onboarding/nowli_how_to_use.dart';
import 'package:mobile_app_dea/screen/Onboarding/onboarding_features/animation.dart';
import 'package:mobile_app_dea/screen/Onboarding/onboarding_features/onboarding_screen.dart';
import 'package:mobile_app_dea/screen/Onboarding/onboarding_features/onbording_fetures.dart';
import 'package:mobile_app_dea/screen/Onboarding/onbording_flow_file/onboarding_flow.dart';
import 'package:mobile_app_dea/screen/ai_call/ai_voice.dart';
import 'package:mobile_app_dea/screen/ai_call/pop_po_sahre.dart';
import 'package:mobile_app_dea/screen/auth/sign_in_screen.dart';
import 'package:mobile_app_dea/screen/auth/sign_up.dart';
import 'package:mobile_app_dea/screen/entry_screen_p2.dart';
import 'package:mobile_app_dea/screen/quests/create_quets/create_quets_default.dart';
import 'package:mobile_app_dea/screen/quests/quests_my_quests_today_emty_state.dart';
import 'package:mobile_app_dea/screen/reday_to_start_screen_p4.dart';
import 'package:mobile_app_dea/screen/splash.dart';
import 'package:mobile_app_dea/screen/test_file/test_file.dart';
import 'package:mobile_app_dea/screen/welcome_activetion_flow/popup_speking.dart';
import 'package:mobile_app_dea/screen/welcome_activetion_flow/procrastination_screen.dart';
import 'package:mobile_app_dea/screen/welcome_come_screen_p3.dart';

class AppPages {
  static final GoRouter router = GoRouter(
    // initialLocation: AppRoutespath.onboardingFlow, // 👈 এখানে add করুন
    routes: [
      GoRoute(
        path: AppRoutespath.splash,
        builder: (context, state) => Splash(),
      ),
      GoRoute(
        path: AppRoutespath.entryScreen,
        builder: (context, state) => EntryScreen(),
      ),
      GoRoute(
        path: AppRoutespath.welcomeScreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutespath.readyToStartScreen,
        builder: (context, state) => ReadyToStartScreen(),
      ),
      GoRoute(
        path: AppRoutespath.signInScreen,
        builder: (context, state) =>
            const SignInScreen(), // Placeholder for SignInScreen
      ),
      GoRoute(
        path: AppRoutespath.signUpScreen,
        builder: (context, state) =>
            const SignUpScreen(), // Placeholder for SignUpScreen
      ),

      /* onboarding */
      GoRoute(
        path: AppRoutespath.onboardingFlow,
        builder: (context, state) => const OnboardingFlow(),
      ),

      /*  create a quets start here  */
      GoRoute(
        path: AppRoutespath.questHomePage,
        builder: (context, state) => const QuestHomePage(),
      ),
      GoRoute(
        path: AppRoutespath.createQuestPage,
        builder: (context, state) => const CreateQuestPage(),
      ),

      /*  create a quets end here  */
      /*   on boarding */
      GoRoute(
        path: AppRoutespath.onboardingFlow,
        builder: (context, state) => const OnboardingFlow(),
      ),

      GoRoute(
        path: AppRoutespath.onbordingFetures,
        builder: (context, state) => OnbordingFetures(),
      ),
      GoRoute(
        path: AppRoutespath.loadingOnboardingNowli,
        builder: (context, state) => const LoadingOnboridngNowli(),
      ),
      GoRoute(
        path: AppRoutespath.nowliHowToUse,
        builder: (context, state) => NowliHowToUse(),
      ),
      GoRoute(
        path: AppRoutespath.animation,
        builder: (context, state) => const Animation(),
      ),
      GoRoute(
        path: AppRoutespath.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutespath.popupSpeking,
        builder: (context, state) => PopupSpeking(),
      ),
      GoRoute(
        path: AppRoutespath.procrastinationScreen,
        builder: (context, state) {
          return ProcrastinationScreen();
        },
      ),
      GoRoute(
        path: AppRoutespath.aiVoice,
        builder: (context, state) => AiVoice(),
      ),
      GoRoute(
        path: AppRoutespath.popPoSahre,
        builder: (context, state) => PopPoSahre(),
      ),

      /*   on boarding end  */
    ],
  );
}
