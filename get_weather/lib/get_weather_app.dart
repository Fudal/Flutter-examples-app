import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get_weather/routing/router.gr.dart';
import 'package:get_weather/style/app_themes.dart';

class GetWeatherApp extends StatefulWidget {
  const GetWeatherApp({super.key});

  @override
  _GetWeatherAppState createState() => _GetWeatherAppState();
}

class _GetWeatherAppState extends State<GetWeatherApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(_navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: mainTheme(),
      ),
    );
  }
}
