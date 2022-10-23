import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/app/movie_app.dart';
import 'package:flutter_recruitment_task/app_initializers/app_initializer.dart';
import 'package:flutter_recruitment_task/injections/bloc_factory.dart';
import 'package:flutter_recruitment_task/injections/modules.dart';
import 'package:flutter_recruitment_task/style/typography.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

Future<void>  main() async {
  Fimber.plantTree(DebugTree());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final GetIt injector = GetIt.instance;
  registerModules(injector);
  final AppInitializer initializer = injector.get();
  await initializer.init();

  runApp(
      MultiProvider(
        providers: [
          Provider<AppTypography>.value(value: AppTypography.recruitmentTask),
          Provider<BlocFactory>(
            create: (context) => BlocFactory(injector: injector),
          ),
        ],
        child: EasyLocalization(
          supportedLocales: const [Locale('pl')],
          path: 'assets/translations',
          fallbackLocale: const Locale('pl'),
          child: const MovieApp(),
        ),
      ),
  );
}
