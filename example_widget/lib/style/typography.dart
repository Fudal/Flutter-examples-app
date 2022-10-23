import 'package:fh_home_coding/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppTypography {
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle buttonText;

  AppTypography({
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.buttonText,
  });

  static TextStyle wrapWithFont(TextStyle style) => GoogleFonts.openSans(textStyle: style);

  TextTheme get textTheme => TextTheme(
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      );

  static AppTypography fhHome = AppTypography(
    bodyLarge: wrapWithFont(
      const TextStyle(
        height: 1.8,
        fontWeight: FontWeight.w600,
        color: AppColors.dark_80,
        fontSize: 13.0,
      ),
    ),
    bodyMedium: wrapWithFont(
      const TextStyle(
        height: 1.8,
        fontWeight: FontWeight.w400,
        color: AppColors.dark_80,
        fontSize: 13.0,
      ),
    ),
    bodySmall: wrapWithFont(
      const TextStyle(
        height: 1.5,
        fontWeight: FontWeight.w700,
        color: AppColors.dark_80,
        fontSize: 11.0,
      ),
    ),
    buttonText: wrapWithFont(
      const TextStyle(
        height: 1.5,
        fontWeight: FontWeight.w700,
        fontSize: 11.0,
      ),
    ),
  );

  static AppTypography of(BuildContext context) => Provider.of<AppTypography>(context, listen: false);

  static AppTypography ofWithListen(BuildContext context) => Provider.of<AppTypography>(context);
}

extension TextStyleExtensions on TextStyle {
  TextStyle singleCenteredLine() => copyWith(height: 1);

  TextStyle accent(BuildContext context) => copyWith(color: Theme.of(context).colorScheme.secondary);

  TextStyle white() => copyWith(color: AppColors.white);

  TextStyle secondary_100() => copyWith(color: AppColors.secondary_100);

  TextStyle success_100() => copyWith(color: AppColors.success_100);

  TextStyle dark_100() => copyWith(color: AppColors.dark_100);

  TextStyle dark_50() => copyWith(color: AppColors.dark_50);

  TextStyle primary_100() => copyWith(color: AppColors.primary_100);

  TextStyle error_100() => copyWith(color: AppColors.error_100);

  TextStyle warning_100() => copyWith(color: AppColors.warning_100);

  TextStyle withColor(Color color) => copyWith(color: color);
}
