import 'package:dalel_ai/core/utils/app_assets.dart';
import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';

import 'package:dalel_ai/features/auth/presentation/widgets/custom_reset_password_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 60)),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    AppStrings.forgotPasswordPage,
                    style: AppTextStyle.poppins28W600.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 40)),
              SliverToBoxAdapter(
                child: Image.asset(
                  AppAssets.imagesForgotPassword,
                  height: 235,
                  width: 235,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Text(
                  "Enter your registered email below to receive password reset instruction",
                  style: AppTextStyle.poppins16W400.copyWith(
                    fontSize: 14,
                    color: AppColors.deepGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
              const SliverToBoxAdapter(
                child: CustomResetPasswordForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
