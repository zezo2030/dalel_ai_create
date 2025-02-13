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

class CustomSignInForm extends StatelessWidget {
  CustomSignInForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
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
                    // TODO: Implement forgot password functionality
                    authCubit.signOut();
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
              CustomButton(
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
