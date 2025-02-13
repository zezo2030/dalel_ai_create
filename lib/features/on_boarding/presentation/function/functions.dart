import 'package:dalel_ai/core/database/cache/cache_helper.dart';
import 'package:dalel_ai/core/router/app_router.dart';
import 'package:dalel_ai/core/services/service_locator.dart';
import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

void goToNextPage(PageController pageController) {
  pageController.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

void goToSignUp() async {
  await getIt<CacheHelper>().saveData(
    key: AppStrings.onboardingVisited,
    value: true,
  );
  AppRouter.router.pushReplacement('/signup');
}

void goToSignIn() async {
  await getIt<CacheHelper>().saveData(
    key: AppStrings.onboardingVisited,
    value: true,
  );
  AppRouter.router.pushReplacement('/signin');
}
