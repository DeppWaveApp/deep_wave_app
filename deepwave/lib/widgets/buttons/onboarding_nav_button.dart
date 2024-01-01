import 'package:deepwave/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class OnboardingNavButton extends StatelessWidget {
  const OnboardingNavButton({
    super.key,
    required this.type,
    required this.icon,
    required this.index,
    required this.navigate,
  });

  final String type;
  final IconData icon;
  final int index;
  final Function navigate;

  @override
  Widget build(BuildContext context) {
    return Material(
        // color: Colors.white,
        child: Center(
      child: Ink(
        decoration: ShapeDecoration(
          color: type == 'back' ? AppColors.whiteColor : AppColors.primaryColor,
          shape: CircleBorder(
            side: BorderSide(
              color: index == 0 && type == 'back'
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
              width: 2,
            ),
          ),
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: type == 'next' || index == 0
                ? AppColors.whiteColor
                : AppColors.primaryColor,
          ),
          onPressed: navigate as VoidCallback?,
        ),
      ),
    ));
  }
}
