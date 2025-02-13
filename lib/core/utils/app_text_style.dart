import 'package:dalel_ai/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle pacifico64W400 = const TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: Color(0xFF6B4B3E),
  );

  static TextStyle poppins16W400 = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle poppins28W600 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle poppins24W500 = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle saira32W700 = const TextStyle(
    fontFamily: 'Saira',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
