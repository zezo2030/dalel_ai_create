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
import '../../../../core/utils/app_text_style.dart';
import 'terms_and_condition.dart';

class CustomSignUpForm extends StatelessWidget {
  CustomSignUpForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          // AppRouter.router.push("/home");
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: AppStrings.fristName,
                onChanged: (value) {
                  authCubit.firstName = value;
                },
                validator: AppValidator.validateName,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: AppStrings.lastName,
                onChanged: (value) {
                  authCubit.lastName = value;
                },
                validator: AppValidator.validateName,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: AppStrings.emailAddress,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  authCubit.emailAddress = value;
                },
                validator: AppValidator.validateEmail,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: AppStrings.password,
                obscureText: true,
                onChanged: (value) {
                  authCubit.password = value;
                },
                validator: AppValidator.validatePassword,
              ),
              TermsAndCondition(
                onChanged: (value) {
                  authCubit.setTermsAccepted(value!);
                },
              ),
              const SizedBox(height: 88),
              state is SignUpLoading
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                      text: AppStrings.signUp,
                      onPressed: authCubit.termsAccepted
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                authCubit.signUpWithEmailAndPassword();
                              }
                            }
                          : null,
                    ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
