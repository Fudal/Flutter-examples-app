import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_recruitment_task/routing/router.gr.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter(navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Portal(
    child: MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Movie Browser',
      theme: ThemeData(primarySwatch: Colors.amber),
    ),
  );
}
