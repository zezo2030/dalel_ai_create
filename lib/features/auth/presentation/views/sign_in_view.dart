import 'package:dalel_ai/core/router/app_router.dart';
import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:dalel_ai/features/auth/presentation/widgets/custom_sign_in_form.dart';
import 'package:dalel_ai/features/auth/presentation/widgets/sign_in_header.dart';
import 'package:dalel_ai/features/auth/presentation/widgets/sign_login_text.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SignInHeader()),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: Text(
            AppStrings.welcomeBack,
            style: AppTextStyle.poppins28W600.copyWith(
              color: AppColors.black,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 48)),
        SliverToBoxAdapter(child: CustomSignInForm()),
        SliverToBoxAdapter(
          child: SignAndLoginText(
            firstText: AppStrings.dontHaveAnAccount,
            lastText: AppStrings.signUp,
            onTap: () {
              AppRouter.router.push("/signUp");
            },
          ),
        )
      ],
    ));
  }
}
