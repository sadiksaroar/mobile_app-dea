import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/screen/Onboarding/onbording_flow_file/onboarding_flow.dart';
import 'package:mobile_app_dea/screen/auth/sign_in_screen.dart';
import 'package:mobile_app_dea/screen/auth/sign_up.dart';
import 'package:mobile_app_dea/screen/entry_screen_p2.dart';
import 'package:mobile_app_dea/screen/reday_to_start_screen_p4.dart';
import 'package:mobile_app_dea/screen/splash.dart';
import 'package:mobile_app_dea/screen/welcome_come_screen_p3.dart';

class AppPages {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboardingFlow, // 👈 এখানে add করুন

    routes: [
      GoRoute(
        path: AppRoutes.splash, //
        builder: (context, state) => Splash(),
      ),
      GoRoute(
        path: AppRoutes.entryScreen,
        builder: (context, state) => EntryScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcomeScreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.readyToStartScreen,
        builder: (context, state) => ReadyToStartScreen(),
      ),
      GoRoute(
        path: AppRoutes.signInScreen,
        builder: (context, state) =>
            const SignInScreen(), // Placeholder for SignInScreen
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        builder: (context, state) =>
            const SignUpScreen(), // Placeholder for SignUpScreen
      ),

      /* onboarding */
      GoRoute(
        path: AppRoutes.onboardingFlow,
        builder: (context, state) => const OnboardingFlow(),
      ),
    ],
  );
}
