import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:my_parcels/routing/router.gr.dart';
import 'package:my_parcels/style/app_themes.dart';

class MyParcelsApp extends StatefulWidget {

  @override
  _MyParcelsAppState createState() => _MyParcelsAppState();
}

class _MyParcelsAppState extends State<MyParcelsApp> {
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
