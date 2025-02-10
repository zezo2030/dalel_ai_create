import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:dalel_ai/features/on_boarding/presentation/view/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';
import 'package:dalel_ai/features/on_boarding/presentation/view/widgets/next_text_widget.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const NextTextWidget(),
              const SizedBox(height: 32),
              const OnBoardingWidgetBody(),
            ],
          ),
        ),
      ),
    );
  }
}
