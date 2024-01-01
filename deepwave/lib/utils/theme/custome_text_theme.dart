import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextTheme {
  static TextStyle? onboardingText(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.secondaryColorLight,
          );
}
