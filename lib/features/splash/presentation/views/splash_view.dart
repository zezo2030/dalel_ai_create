import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_strings.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  void _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final bool hasSeenOnboarding = getIt<CacheHelper>().getData(
          key: AppStrings.onboardingVisited,
        ) ??
        false;

    if (hasSeenOnboarding) {
      context.go('/signup');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Dalel',
          style: AppTextStyle.pacifico64W400,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
