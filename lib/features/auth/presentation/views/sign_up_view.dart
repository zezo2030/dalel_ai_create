import 'package:dalel_ai/core/router/app_router.dart';
import 'package:dalel_ai/core/utils/app_strings.dart';
import 'package:dalel_ai/core/utils/app_text_style.dart';
import 'package:dalel_ai/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:dalel_ai/features/auth/presentation/widgets/sign_login_text.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 108)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.welcome,
                  style: AppTextStyle.poppins28W600,
                  textAlign: TextAlign.center,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 40)),
              SliverToBoxAdapter(
                child: CustomSignUpForm(),
              ),
              SliverToBoxAdapter(
                child: SignAndLoginText(
                  firstText: AppStrings.alreadyHaveAnAccount,
                  lastText: AppStrings.signIn,
                  onTap: () {
                    AppRouter.router.push("/signIn");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
