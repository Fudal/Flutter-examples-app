import 'package:fh_home_coding/extensions/context_extension.dart';
import 'package:fh_home_coding/style/colors.dart';
import 'package:fh_home_coding/style/dimens.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color backgroundColor;
  final Color contentColor;
  final BorderSide? side;
  final double? iconSize;

  const RoundedButton({
    super.key,
    required this.text,
    this.contentColor = AppColors.white,
    this.backgroundColor = AppColors.dark_80,
    this.iconSize = Dimens.spacingM,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        side: side,
      ),
      onPressed: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null)
            Icon(prefixIcon, color: contentColor, size: iconSize),
          if (prefixIcon == null)
            const SizedBox(width: Dimens.spacingXs),
          Flexible(
            child: Padding(
              padding: suffixIcon == null ? const EdgeInsets.only(right: Dimens.spacingXs) : EdgeInsets.zero,
              child: Text(
                text,
                style: context.typo.buttonText.copyWith(color: contentColor),
              ),
            ),
          ),
          if (suffixIcon != null)
            Icon(suffixIcon, color: contentColor, size: iconSize),
        ],
      ),
    );
  }
}
