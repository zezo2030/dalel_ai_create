import 'package:dalel_ai/core/utils/app_assets.dart';
import 'package:dalel_ai/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:dalel_ai/features/on_boarding/presentation/widgets/on_boarding_image.dart';
import 'package:dalel_ai/features/on_boarding/presentation/widgets/on_boarding_text_content.dart';
import 'package:dalel_ai/features/on_boarding/presentation/widgets/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatefulWidget {
  final Function(int) onPageChanged;
  final PageController controller;

  const OnBoardingWidgetBody({
    super.key,
    required this.onPageChanged,
    required this.controller,
  });

  @override
  State<OnBoardingWidgetBody> createState() => _OnboardingWidgetBodyState();
}

class _OnboardingWidgetBodyState extends State<OnBoardingWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        controller: widget.controller,
        itemCount: onBoardingList.length,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) => _buildPageContent(index),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    return Column(
      children: [
        OnBoardingImage(imagePath: AppAssets.imagesOnBoarding1),
        const SizedBox(height: 24),
        CustomSmoothPageIndicator(
          controller: widget.controller,
          count: 3,
        ),
        const SizedBox(height: 24),
        OnBoardingTextContent(
          title: 'Explore The history with Dalel in a smart way',
          subTitle:
              "Using our app's history libraries you can find many historical periodsy",
        ),
      ],
    );
  }
}
