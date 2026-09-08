import 'package:go_router/go_router.dart';
import 'package:noteflow/splash_view.dart';

class AppRouter {
  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
    ],
  );
}
