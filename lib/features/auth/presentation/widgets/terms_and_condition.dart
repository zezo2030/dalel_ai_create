import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

class TermsAndCondition extends StatefulWidget {
  final Function(bool?) onChanged;

  const TermsAndCondition({
    super.key,
    required this.onChanged,
  });

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChanged(value);
            });
          },
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        Text(
          AppStrings.iHaveAgreeToOur,
          style: AppTextStyle.poppins16W400.copyWith(
            color: AppColors.grey,
            fontSize: 12,
          ),
        ),
        InkWell(
          onTap: () {
            // Handle terms and conditions tap
          },
          child: Text(
            AppStrings.termsAndCondition,
            style: AppTextStyle.poppins16W400.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
