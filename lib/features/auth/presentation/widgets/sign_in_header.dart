import 'package:dalel_ai/core/utils/app_assets.dart';
import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          // Bottom left image
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(AppAssets.imagesVector1),
          ),

          // Center text
          Center(
            child: Text(
              AppStrings.appName,
              style: AppTextStyle.saira32W700,
            ),
          ),

          // Bottom right image
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(AppAssets.imagesVector2),
          ),
        ],
      ),
    );
  }
}
