import 'package:dalel_ai/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextField(
            hintText: 'Email',
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
