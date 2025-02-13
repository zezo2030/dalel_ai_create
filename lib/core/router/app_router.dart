import 'package:dalel_ai/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_ai/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel_ai/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel_ai/features/home/presentation/views/home_view.dart';
import 'package:dalel_ai/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      GoRoute(
        path: '/signup',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
