import 'package:dalel_ai/core/router/app_router.dart';
import 'package:dalel_ai/core/widgets/custom_btn.dart';
import 'package:dalel_ai/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_ai/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_toast.dart';

class CustomResetPasswordForm extends StatelessWidget {
  const CustomResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          AppToast.showSuccessToast(
              "Password reset email sent. Please check your inbox.");
          AppRouter.router.pushReplacement("/signin");
        } else if (state is ResetPasswordError) {
          AppToast.showErrorToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                onChanged: (value) {
                  authCubit.emailResetPassword = value;
                },
                hintText: AppStrings.emailAddress,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidator.validateEmail,
              ),
              const SizedBox(height: 32),
              state is ResetPasswordLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : CustomButton(
                      text: 'Reset Password',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authCubit.resetPassword();
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
