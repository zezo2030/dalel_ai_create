import 'package:flutter/material.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';

class OnBoardingTextContent extends StatelessWidget {
  final String title;
  final String subTitle;

  const OnBoardingTextContent({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.poppins24W500.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        Text(
          subTitle,
          style: AppTextStyle.poppins16W400,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
} 