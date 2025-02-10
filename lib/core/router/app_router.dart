import 'package:dalel_ai/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:go_router/go_router.dart';
import 'package:dalel_ai/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
