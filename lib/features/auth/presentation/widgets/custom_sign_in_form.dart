import 'package:dalel_ai/core/router/app_router.dart';
import 'package:dalel_ai/core/widgets/custom_btn.dart';
import 'package:dalel_ai/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_ai/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/app_toast.dart';

class CustomSignInForm extends StatelessWidget {
  CustomSignInForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          AppRouter.router.pushReplacement("/home");
        } else if (state is SignInError) {
          AppToast.showErrorToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    AppRouter.router.pushReplacement("/resetpassword");
                    _formKey.currentState!.reset();
                  },
                  child: Text(
                    AppStrings.forgotPassword,
                    style: AppTextStyle.poppins28W600.copyWith(
                      fontSize: 12,
                      color: AppColors.deepGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              state is SignInLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : CustomButton(
                      text: AppStrings.signIn,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      },
                    ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
