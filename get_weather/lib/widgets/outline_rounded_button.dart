import 'package:flutter/material.dart';
import 'package:get_weather/style/colors.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';

class OutlineRoundedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const OutlineRoundedButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed?.call,
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 2,
        shadowColor: AppColors.secondary_100.withOpacity(0.5),
      ).copyWith(
        overlayColor: MaterialStateColor.resolveWith((states) =>
            AppColors.secondary_100.withOpacity(0.2),),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.focused)) return AppColors.secondary_100;
          return AppColors.white;
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingL,
          vertical: Dimens.spacingS,
        ),
        child: Text(
          text,
          style: AppTypography.of(context).body2,
        ),
      ),
    );
  }
}
