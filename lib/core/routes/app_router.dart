import 'package:go_router/go_router.dart';
import 'package:noteflow/features/auth/presentation/views/login_view.dart';
import 'package:noteflow/features/home/presentation/views/home_view.dart';
import 'package:noteflow/root_view.dart';
import 'package:noteflow/splash_view.dart';

class AppRouter {
  static String homeView = '/homeView';
  static String loginView = '/loginView';
  static String rootView = '/rootView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: rootView,
        builder: (context, state) => RootView(),
      ),
    ],
  );
}
