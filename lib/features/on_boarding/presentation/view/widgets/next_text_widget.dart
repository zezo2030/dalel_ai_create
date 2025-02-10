import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class NextTextWidget extends StatelessWidget {
  const NextTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        AppStrings.next,
        style: AppTextStyle.poppins16W400,
      ),
    );
  }
}
