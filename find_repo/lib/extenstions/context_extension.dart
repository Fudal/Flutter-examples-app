import 'package:find_repo/style/typography.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {

  AppTypography get typo => AppTypography.of(this);
}

extension StfulContextExtensions on State {
  AppTypography get typo => AppTypography.of(context);
}
