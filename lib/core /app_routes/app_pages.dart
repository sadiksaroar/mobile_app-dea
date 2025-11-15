import 'package:go_router/go_router.dart';
import 'package:mobile_app_dea/core%20/app_routes/app_routes.dart';
import 'package:mobile_app_dea/screen/entry_screen_p2.dart';
import 'package:mobile_app_dea/screen/splash.dart';

class AppPages {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash, //
        builder: (context, state) => Splash(),
      ),
      GoRoute(
        path: AppRoutes.entryScreen,
        builder: (context, state) => EntryScreen(),
      ),
    ],
  );
}
