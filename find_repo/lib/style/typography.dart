import 'package:find_repo/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppTypography {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle body1;
  final TextStyle body2;

  AppTypography({
    required this.headline1,
    required this.headline2,
    required this.body1,
    required this.body2,
  });

  static TextStyle wrapWithFont(TextStyle style) => GoogleFonts.inter(textStyle: style);

  TextTheme get textTheme => TextTheme(
    headline1: headline1,
    headline2: headline2,
  );

  static AppTypography findRepo = AppTypography(
    headline1: wrapWithFont(const TextStyle(
      height: 1.25,
      fontWeight: FontWeight.w600,
      fontSize: 32.0,
    ),),
    headline2: wrapWithFont(const TextStyle(
      height: 1.33,
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
    ),),
    body1: wrapWithFont(const TextStyle(
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),),
    body2: wrapWithFont(const TextStyle(
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),),
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

  TextStyle withColor(Color color) => copyWith(color: color);
}
