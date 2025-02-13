import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SignAndLoginText extends StatelessWidget {
  const SignAndLoginText({
    super.key,
    this.onTap,
    required this.firstText,
    required this.lastText,
  });

  final void Function()? onTap;
  final String firstText;
  final String lastText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText,
            style: AppTextStyle.poppins16W400.copyWith(
              color: AppColors.deepGrey,
              fontSize: 12,
            )),
        GestureDetector(
          onTap: onTap,
          child: Text(
            lastText,
            style: AppTextStyle.poppins16W400.copyWith(
              color: AppColors.primaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
