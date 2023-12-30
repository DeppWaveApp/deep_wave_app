import 'package:deepwave/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColorLight,
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.tintColor,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF242424),
          fontFamily: 'Nunito Sans',
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.secondaryColor,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColorLight,
      primaryColorDark: AppColors.primaryColorDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.tintColor,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF4F5F9),
          fontFamily: 'Nunito Sans',
        ),
      ),
    );
  }
}
