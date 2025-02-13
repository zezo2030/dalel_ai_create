import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:dalel_ai/core/widgets/custom_btn.dart';
import 'package:dalel_ai/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:dalel_ai/features/on_boarding/presentation/function/functions.dart';
import 'package:dalel_ai/features/on_boarding/presentation/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';
import 'package:dalel_ai/features/on_boarding/presentation/widgets/next_text_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  bool isLastPage = false;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
              isLastPage ? Container() : const NextTextWidget(),
              const SizedBox(height: 32),
              OnBoardingWidgetBody(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index ==
                        onBoardingList.length -
                            1; // assuming you have 3 pages (0,1,2)
                  });
                },
              ),
              const SizedBox(height: 60),
              if (!isLastPage)
                CustomButton(
                  text: AppStrings.next,
                  onPressed: () => goToNextPage(pageController),
                )
              else ...[
                CustomButton(
                    text: AppStrings.createAccount, onPressed: goToSignUp),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: goToSignIn,
                  child: Text(
                    AppStrings.signIn,
                    style: AppTextStyle.poppins16W400.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
