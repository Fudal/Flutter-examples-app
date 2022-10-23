import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/presentation/home/home_page.dart';
import 'package:fh_home_coding/style/app_themes.dart';
import 'package:flutter/material.dart';

class FhHomeCodingApp extends StatelessWidget {
  const FhHomeCodingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: mainTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
