import 'package:dalel_ai/core/utils/app_assets.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:dalel_ai/features/on_boarding/presentation/view/widgets/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatefulWidget {
  const OnBoardingWidgetBody({super.key});

  @override
  State<OnBoardingWidgetBody> createState() => _OnBoardingWidgetBodyState();
}

class _OnBoardingWidgetBodyState extends State<OnBoardingWidgetBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 290,
                width: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.imagesOnBoarding1),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(
                controller: _pageController,
                count: 3,
              ),
              const SizedBox(height: 24),
              Text(
                'Explore The history with Dalel in a smart way',
                style: AppTextStyle.poppins24W500.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Text(
                'Using our app’s history libraries you can find many historical periodsy',
                style: AppTextStyle.poppins16W400,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
