import 'package:easy_localization/easy_localization.dart';
import 'package:find_repo/routing/router.gr.dart';
import 'package:find_repo/style/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class FindRepoApp extends StatefulWidget {

  @override
  _FindRepoAppState createState() => _FindRepoAppState();
}

class _FindRepoAppState extends State<FindRepoApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter(navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: mainTheme(),
      ),
    );
  }
}
