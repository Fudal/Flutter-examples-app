import 'package:flutter/material.dart';
import 'package:get_weather/style/typography.dart';

extension ContextExtensions on BuildContext {

  AppTypography get typo => AppTypography.of(this);
}

extension StfulContextExtensions on State {
  AppTypography get typo => AppTypography.of(context);
}
