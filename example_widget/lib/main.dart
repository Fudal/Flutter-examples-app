import 'package:easy_localization/easy_localization.dart';
import 'package:fh_home_coding/fh_home_coding_app.dart';
import 'package:fh_home_coding/style/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final supportedLocales = [
    "en",
    "pl",
  ].map((e) => Locale(e, '')).toList();

  runApp(
    Provider<AppTypography>(
      create: (context) => AppTypography.fhHome,
      child: EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        useFallbackTranslations: true,
        useOnlyLangCode: true,
        fallbackLocale: const Locale('pl'),
        child: const FhHomeCodingApp(),
      ),
    ),
  );
}
