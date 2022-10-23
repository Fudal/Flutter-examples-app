import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_parcels/style/colors.dart';

ThemeData mainTheme() => ThemeData(
    appBarTheme: mainAppBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primary_100,
    colorScheme: ThemeData().colorScheme.copyWith(
      secondary: AppColors.secondary_100,
      primary: AppColors.primary_100,
    ),
    splashColor: AppColors.white,
    highlightColor: AppColors.primary_100.withOpacity(0.5),);

AppBarTheme get mainAppBarTheme => const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle.light,
);
